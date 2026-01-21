# CHANGE TO THE TESTBENCH WE WANT TO SIMULATE
# TOP_ENTITY = sbox_tb
# TOP_ENTITY = shift_rows_tb
# TOP_ENTITY = sub_bytes_tb
# TOP_ENTITY = gf_mult_by2_tb
# TOP_ENTITY = mix_columns_tb
TOP_ENTITY = key_expansion_tb

# All testbenches for run-all
ALL_TBS = sbox_tb shift_rows_tb sub_bytes_tb gf_mult_by2_tb mix_columns_tb key_expansion_tb

# FILES
WAVE_FILE = wave.vcd
	
# GHDL CONFIG
GHDL_CMD   = ghdl   
GHDL_FLAGS = --std=08      
	
# TOOLS      
VIEWER = surfer     
	
# Source directories
SRC_DIR = src
TB_DIR  = tb
	
# ------------------------------------------------------------------------------   
# RULES      
# ------------------------------------------------------------------------------   
	
all: clean run view 
	
# 1. Compile: Import all source files, then testbenches, then elaborate     
compile:     
	@echo "--- Compiling Sources ---"  
	$(GHDL_CMD) -i $(GHDL_FLAGS) $(SRC_DIR)/*.vhd    
	$(GHDL_CMD) -i $(GHDL_FLAGS) $(TB_DIR)/*.vhd     
	@echo "--- Elaborating $(TOP_ENTITY) ---" 
	$(GHDL_CMD) -m $(GHDL_FLAGS) $(TOP_ENTITY)
	
# 2. Run the simulation
run: compile
	@echo "--- Running Simulation ---"
	$(GHDL_CMD) -r $(GHDL_FLAGS) $(TOP_ENTITY) --vcd=$(WAVE_FILE)

# 2b. Run all testbenches
run-all: compile-all
	@echo "--- Running All Testbenches ---"
	@for tb in $(ALL_TBS); do \
		echo ""; \
		echo "=== Running $$tb ==="; \
		$(GHDL_CMD) -r $(GHDL_FLAGS) $$tb; \
	done
	@echo ""
	@echo "=== All testbenches completed ==="

# Compile all testbenches
compile-all:
	@echo "--- Compiling Sources ---"
	$(GHDL_CMD) -i $(GHDL_FLAGS) $(SRC_DIR)/*.vhd
	$(GHDL_CMD) -i $(GHDL_FLAGS) $(TB_DIR)/*.vhd
	@for tb in $(ALL_TBS); do \
		echo "--- Elaborating $$tb ---"; \
		$(GHDL_CMD) -m $(GHDL_FLAGS) $$tb; \
	done 
	
# 3. Open the Waveform Viewer
view:
	@echo "--- Opening Waveform ---"
	$(VIEWER) $(WAVE_FILE) > /dev/null 2>&1 &    
	
# 4. Clean up generated files     
clean:
	@echo "--- Cleaning ---"    
	$(GHDL_CMD) --clean  
	rm -f $(WAVE_FILE) *.cf
	clear
	
.PHONY: all compile run run-all compile-all view clean
