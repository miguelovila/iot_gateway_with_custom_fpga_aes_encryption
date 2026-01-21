#!/bin/bash

# Converts a 4x4 AES state matrix to plaintext hex string
# Reads column by column (top to bottom, left to right)

if [ -z "$1" ]; then
    echo "Usage: $0 'a4 68 6b 02 9c 9f 5b 6a 7f 35 ea 50 f2 2b 43 49'"
    echo "Or paste multi-line matrix as a single quoted argument"
    exit 1
fi

input=$(echo "$1" | tr '\n' ' ' | tr -s ' ')

# Read values into array
read -ra values <<< "$input"

if [ ${#values[@]} -ne 16 ]; then
    echo "Error: Expected 16 hex values, got ${#values[@]}"
    exit 1
fi

result=""
for col in 0 1 2 3; do
    for row in 0 1 2 3; do
        idx=$((row * 4 + col))
        result+="${values[$idx]}"
    done
done

echo "${result^^}"
