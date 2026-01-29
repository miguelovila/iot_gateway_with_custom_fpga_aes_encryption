"""tkinter GUI for real-time FPGA I/O monitoring."""

import queue
import time
import tkinter as tk
from typing import Callable

from protocol import SensorState

# Colors (Catppuccin Mocha-inspired)
COLOR_BG = "#1e1e2e"
COLOR_SURFACE = "#313244"
COLOR_FG = "#cdd6f4"
COLOR_LABEL = "#a6adc8"
COLOR_OUTLINE = "#45475a"
COLOR_GREEN = "#a6e3a1"
COLOR_RED = "#f38ba8"
COLOR_DARK = "#313244"
COLOR_ACCENT = "#89b4fa"

# LED
LED_RADIUS = 14
LED_SPACING = 36

# Switch
SW_TRACK_W = 12
SW_TRACK_H = 28
SW_HANDLE_W = 16
SW_HANDLE_H = 8
SW_SPACING = 36

# Button
BTN_RADIUS = 14
BTN_SPACING = 36


class FpgaMonitor(tk.Tk):
    """Main application window displaying FPGA LED, switch, and button state."""

    def __init__(
        self,
        state_queue: queue.Queue,
        send_command: Callable[[str], None],
        set_listener_key: Callable[[bytes], None],
    ):
        super().__init__()
        self.state_queue = state_queue
        self.send_command = send_command
        self.set_listener_key = set_listener_key
        self.packets_received = 0
        self.last_update: float | None = None

        self._accel_move_enabled = False
        self._accel_base_x = 0.0
        self._accel_base_y = 0.0
        self._accel_target_x = 0.0
        self._accel_target_y = 0.0
        self._accel_cur_x = 0.0
        self._accel_cur_y = 0.0

        self.title("FPGA Monitor")
        self.configure(bg=COLOR_BG)
        self.resizable(False, False)

        self._build_ui()
        self.poll_queue()

    # ── UI construction ──────────────────────────────────────────

    def _build_ui(self) -> None:
        tk.Label(
            self, text="FPGA I/O Monitor", font=("Helvetica", 18, "bold"),
            bg=COLOR_BG, fg=COLOR_FG,
        ).pack(pady=(14, 6))

        self._build_led_panel()
        self._build_switch_panel()
        self._build_button_panel()
        self._build_temp_display()
        self._build_accel_display()
        self._build_controls()

        self.status_var = tk.StringVar(value="Waiting for packets...")
        tk.Label(
            self, textvariable=self.status_var, font=("Helvetica", 10),
            bg=COLOR_BG, fg=COLOR_LABEL, anchor="w",
        ).pack(fill="x", padx=14, pady=(4, 10))

    # ── LED panel (clickable green circles) ──────────────────────

    def _build_led_panel(self) -> None:
        tk.Label(
            self, text="LEDs (click to toggle)", font=("Helvetica", 12, "bold"),
            bg=COLOR_BG, fg=COLOR_FG,
        ).pack(pady=(8, 0))

        width = 16 * LED_SPACING + LED_SPACING
        height = LED_RADIUS * 2 + 30
        self.led_canvas = tk.Canvas(
            self, width=width, height=height, bg=COLOR_BG, highlightthickness=0,
            cursor="hand2",
        )
        self.led_canvas.pack()

        self.led_indicators: list[int] = []
        for i in range(16):
            cx = LED_SPACING + (15 - i) * LED_SPACING
            cy = LED_RADIUS + 4
            oval = self.led_canvas.create_oval(
                cx - LED_RADIUS, cy - LED_RADIUS,
                cx + LED_RADIUS, cy + LED_RADIUS,
                fill=COLOR_DARK, outline=COLOR_OUTLINE, width=2,
            )
            self.led_indicators.append(oval)
            self.led_canvas.create_text(
                cx, cy + LED_RADIUS + 10, text=str(i),
                fill=COLOR_LABEL, font=("Helvetica", 9),
            )
            self.led_canvas.tag_bind(
                oval, "<Button-1>", lambda _e, idx=i: self._on_led_click(idx),
            )
        
        self.led_canvas.bind("<Button-4>", lambda _e: self._on_led_scroll(1))
        self.led_canvas.bind("<Button-5>", lambda _e: self._on_led_scroll(-1))

    def _on_led_click(self, index: int) -> None:
        self.send_command(f"L{index}")

    def _on_led_scroll(self, direction: int) -> None:
        self.send_command(f"L{direction == 1 and 'R' or 'L'}")

    # ── Switch panel (vertical toggle switches) ──────────────────

    def _build_switch_panel(self) -> None:
        tk.Label(
            self, text="Switches", font=("Helvetica", 12, "bold"),
            bg=COLOR_BG, fg=COLOR_FG,
        ).pack(pady=(8, 0))

        width = 16 * SW_SPACING + SW_SPACING
        height = SW_TRACK_H + 30
        self.sw_canvas = tk.Canvas(
            self, width=width, height=height, bg=COLOR_BG, highlightthickness=0,
        )
        self.sw_canvas.pack()

        self.sw_tracks: list[int] = []
        self.sw_handles: list[int] = []
        for i in range(16):
            cx = SW_SPACING + (15 - i) * SW_SPACING
            # Track
            track = self.sw_canvas.create_rectangle(
                cx - SW_TRACK_W // 2, 4,
                cx + SW_TRACK_W // 2, 4 + SW_TRACK_H,
                fill=COLOR_RED, outline=COLOR_OUTLINE, width=2,
            )
            self.sw_tracks.append(track)
            # Handle (OFF = bottom)
            hy = 4 + SW_TRACK_H - SW_HANDLE_H
            handle = self.sw_canvas.create_rectangle(
                cx - SW_HANDLE_W // 2, hy,
                cx + SW_HANDLE_W // 2, hy + SW_HANDLE_H,
                fill=COLOR_FG, outline=COLOR_OUTLINE, width=1,
            )
            self.sw_handles.append(handle)
            # Label
            self.sw_canvas.create_text(
                cx, 4 + SW_TRACK_H + 12, text=str(i),
                fill=COLOR_LABEL, font=("Helvetica", 9),
            )

    # ── Button panel (circles, red/green) ────────────────────────

    def _build_button_panel(self) -> None:
        tk.Label(
            self, text="Buttons", font=("Helvetica", 12, "bold"),
            bg=COLOR_BG, fg=COLOR_FG,
        ).pack(pady=(8, 0))

        width = 5 * BTN_SPACING + BTN_SPACING
        height = BTN_RADIUS * 2 + 30
        self.btn_canvas = tk.Canvas(
            self, width=width, height=height, bg=COLOR_BG, highlightthickness=0,
        )
        self.btn_canvas.pack()

        self.btn_indicators: list[int] = []
        for i in range(5):
            cx = BTN_SPACING + i * BTN_SPACING
            cy = BTN_RADIUS + 4
            oval = self.btn_canvas.create_oval(
                cx - BTN_RADIUS, cy - BTN_RADIUS,
                cx + BTN_RADIUS, cy + BTN_RADIUS,
                fill=COLOR_RED, outline=COLOR_OUTLINE, width=2,
            )
            self.btn_indicators.append(oval)
            self.btn_canvas.create_text(
                cx, cy + BTN_RADIUS + 10, text=str(i),
                fill=COLOR_LABEL, font=("Helvetica", 9),
            )

    # ── Temperature display ─────────────────────────────────────

    def _build_temp_display(self) -> None:
        tk.Label(
            self, text="Temperature", font=("Helvetica", 12, "bold"),
            bg=COLOR_BG, fg=COLOR_FG,
        ).pack(pady=(8, 0))

        self.temp_var = tk.StringVar(value="-- °C")
        tk.Label(
            self, textvariable=self.temp_var, font=("Helvetica", 22),
            bg=COLOR_BG, fg=COLOR_ACCENT,
        ).pack(pady=(0, 2))

    # ── Accelerometer display ──────────────────────────────────────

    def _build_accel_display(self) -> None:
        tk.Label(
            self, text="Accelerometer", font=("Helvetica", 12, "bold"),
            bg=COLOR_BG, fg=COLOR_FG,
        ).pack(pady=(8, 0))

        frame = tk.Frame(self, bg=COLOR_BG)
        frame.pack(pady=(0, 2))

        self.accel_x_var = tk.StringVar(value="X: -- mg")
        self.accel_y_var = tk.StringVar(value="Y: -- mg")
        self.accel_z_var = tk.StringVar(value="Z: -- mg")

        for var in (self.accel_x_var, self.accel_y_var, self.accel_z_var):
            tk.Label(
                frame, textvariable=var, font=("Helvetica", 16),
                bg=COLOR_BG, fg=COLOR_ACCENT, width=12,
            ).pack(side="left", padx=8)

    # ── Controls panel (delay + key) ─────────────────────────────

    def _build_controls(self) -> None:
        tk.Frame(self, height=1, bg=COLOR_OUTLINE).pack(fill="x", padx=14, pady=(10, 0))

        tk.Label(
            self, text="Controls", font=("Helvetica", 12, "bold"),
            bg=COLOR_BG, fg=COLOR_FG,
        ).pack(pady=(6, 4))

        ctrl = tk.Frame(self, bg=COLOR_BG)
        ctrl.pack(padx=14, pady=(0, 4))

        # Delay
        tk.Label(
            ctrl, text="Delay (ms):", font=("Helvetica", 10),
            bg=COLOR_BG, fg=COLOR_LABEL,
        ).grid(row=0, column=0, sticky="e", padx=(0, 6), pady=3)

        self.delay_entry = tk.Entry(
            ctrl, width=10, font=("Helvetica", 10),
            bg=COLOR_SURFACE, fg=COLOR_FG, insertbackground=COLOR_FG,
            relief="flat", bd=2,
        )
        self.delay_entry.insert(0, "500")
        self.delay_entry.grid(row=0, column=1, padx=(0, 6), pady=3)

        tk.Button(
            ctrl, text="Set", font=("Helvetica", 9),
            bg=COLOR_ACCENT, fg=COLOR_BG, activebackground=COLOR_GREEN,
            relief="flat", padx=8, command=self._on_set_delay,
        ).grid(row=0, column=2, pady=3)

        # AES key
        tk.Label(
            ctrl, text="AES Key:", font=("Helvetica", 10),
            bg=COLOR_BG, fg=COLOR_LABEL,
        ).grid(row=1, column=0, sticky="e", padx=(0, 6), pady=3)

        self.key_entry = tk.Entry(
            ctrl, width=34, font=("Courier", 10),
            bg=COLOR_SURFACE, fg=COLOR_FG, insertbackground=COLOR_FG,
            relief="flat", bd=2,
        )
        self.key_entry.insert(0, "2B7E151628AED2A6ABF7158809CF4F3C")
        self.key_entry.grid(row=1, column=1, padx=(0, 6), pady=3)

        tk.Button(
            ctrl, text="Set", font=("Helvetica", 9),
            bg=COLOR_ACCENT, fg=COLOR_BG, activebackground=COLOR_GREEN,
            relief="flat", padx=8, command=self._on_set_key,
        ).grid(row=1, column=2, pady=3)

        # Accelerometer window movement
        self._accel_var = tk.BooleanVar(value=False)
        tk.Checkbutton(
            ctrl, text="Accel Window", font=("Helvetica", 10),
            variable=self._accel_var, command=self._on_accel_toggle,
            bg=COLOR_BG, fg=COLOR_LABEL, selectcolor=COLOR_SURFACE,
            activebackground=COLOR_BG, activeforeground=COLOR_FG,
        ).grid(row=2, column=0, columnspan=3, pady=3)

    def _on_accel_toggle(self) -> None:
        self._accel_move_enabled = self._accel_var.get()
        if self._accel_move_enabled:
            self.update_idletasks()
            self._accel_cur_x = float(self.winfo_x())
            self._accel_cur_y = float(self.winfo_y())
            self._accel_base_x = self._accel_cur_x
            self._accel_base_y = self._accel_cur_y
            self._accel_target_x = self._accel_cur_x
            self._accel_target_y = self._accel_cur_y
            self._accel_animate()

    def _accel_animate(self) -> None:
        if not self._accel_move_enabled:
            return
        alpha = 0.12
        self._accel_cur_x += (self._accel_target_x - self._accel_cur_x) * alpha
        self._accel_cur_y += (self._accel_target_y - self._accel_cur_y) * alpha
        win_w = self.winfo_width()
        win_h = self.winfo_height()
        scr_w = self.winfo_screenwidth()
        scr_h = self.winfo_screenheight()
        x = max(0, min(int(self._accel_cur_x), scr_w - win_w))
        y = max(0, min(int(self._accel_cur_y), scr_h - win_h))
        self.geometry(f"{win_w}x{win_h}+{x}+{y}")
        self.after(16, self._accel_animate)

    def _on_set_delay(self) -> None:
        val = self.delay_entry.get().strip()
        if val.isdigit() and int(val) > 0:
            self.send_command(f"D{val}")

    def _on_set_key(self) -> None:
        hex_str = self.key_entry.get().strip()
        if len(hex_str) != 32:
            return
        try:
            new_key = bytes.fromhex(hex_str)
        except ValueError:
            return
        self.send_command(f"K{hex_str.upper()}")
        self.set_listener_key(new_key)

    # ── State update ─────────────────────────────────────────────

    def poll_queue(self) -> None:
        """Drain the queue and update the display (called every 50 ms)."""
        state: SensorState | None = None
        try:
            while True:
                state = self.state_queue.get_nowait()
                self.packets_received += 1
        except queue.Empty:
            pass

        if state is not None:
            self.last_update = time.time()
            self._update_display(state)

        self.after(10, self.poll_queue)

    def _update_display(self, state: SensorState) -> None:
        # LEDs
        for i in range(16):
            on = bool(state.leds & (1 << i))
            self.led_canvas.itemconfig(
                self.led_indicators[i],
                fill=COLOR_GREEN if on else COLOR_DARK,
            )

        # Switches
        for i in range(16):
            on = bool(state.switches & (1 << i))
            cx = SW_SPACING + (15 - i) * SW_SPACING
            self.sw_canvas.itemconfig(
                self.sw_tracks[i],
                fill=COLOR_GREEN if on else COLOR_RED,
            )
            if on:
                hy = 4
            else:
                hy = 4 + SW_TRACK_H - SW_HANDLE_H
            self.sw_canvas.coords(
                self.sw_handles[i],
                cx - SW_HANDLE_W // 2, hy,
                cx + SW_HANDLE_W // 2, hy + SW_HANDLE_H,
            )

        # Buttons
        for i in range(5):
            on = bool(state.buttons & (1 << i))
            self.btn_canvas.itemconfig(
                self.btn_indicators[i],
                fill=COLOR_GREEN if on else COLOR_RED,
            )

        # Temperature
        self.temp_var.set(f"{state.temp_celsius:.1f} °C")

        # Accelerometer
        self.accel_x_var.set(f"X: {state.accel_x} mg")
        self.accel_y_var.set(f"Y: {state.accel_y} mg")
        self.accel_z_var.set(f"Z: {state.accel_z} mg")

        if self._accel_move_enabled:
            scale = 0.3
            self._accel_target_x = self._accel_base_x - state.accel_y * scale
            self._accel_target_y = self._accel_base_y + state.accel_x * scale

        # Status bar
        ts = time.strftime("%H:%M:%S", time.localtime(self.last_update))
        self.status_var.set(
            f"Seq: {state.seq}  |  Packets: {self.packets_received}  |  Last update: {ts}"
        )
