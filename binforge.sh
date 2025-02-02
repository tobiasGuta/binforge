#!/bin/bash

# More robust filename handling: check if argument is provided and handle potential errors
if [ -z "$1" ]; then
  echo "Usage: $0 <assembly_file.s> [-g] [args...]"
  exit 1
fi

fileName="${1%%.*}"
assemblyFile="${fileName}.s"
objectFile="${fileName}.o"

# Check if the assembly file exists
if [ ! -f "$assemblyFile" ]; then
  echo "Error: Assembly file '$assemblyFile' not found."
  exit 1
fi

# Assemble and check for errors
nasm -f elf64 "$assemblyFile"
if [ $? -ne 0 ]; then
  echo "Error: Assembly failed."
  exit 1
fi

# Link and check for errors
ld "$objectFile" -o "$fileName"
if [ $? -ne 0 ]; then
  echo "Error: Linking failed."
  exit 1
fi

# Debugging or Execution
if [[ "$2" == "-g" ]]; then
  shift 2  # Remove '-g' from argument list
  gdb -q --args "./$fileName" "$@"
else
  "./$fileName" "$@"
fi

# Optional: Clean up object files (comment out if not needed)
# rm -f "$objectFile"
