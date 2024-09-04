#!/bin/bash

# Check if the input file is provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <file.pdf>"
  exit 1
fi

# Define input PDF file
input_pdf="$1"

# Check if input file exists
if [ ! -f "$input_pdf" ]; then
  echo "File not found: $input_pdf"
  exit 1
fi

# Create a temporary directory
temp_dir=$(mktemp -d)
if [ ! -d "$temp_dir" ]; then
  echo "Failed to create temporary directory"
  exit 1
fi

# Define output PNG file in the temporary directory
output_png="$temp_dir/file.png"

# Convert PDF to PNG using pdftoppm
pdftoppm "$input_pdf" "$temp_dir/file" -png -singlefile
if [ $? -ne 0 ]; then
  echo "Failed to convert PDF to PNG"
  rm -rf "$temp_dir"
  exit 1
fi

# # Display the PNG image using viu in new kitty window
viu "$output_png"

# Clean up: Remove the temporary directory
rm -rf "$temp_dir"
