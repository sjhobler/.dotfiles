#!/bin/bash

open_file() {
    local file="$1"
    case "$file" in
        *.pdf)
            zathura "$file"
            ;;
        *.py|*.R|*.do|*.jl|*.txt|*.toml|*.yaml|*.lua|*.sh|*.pl|*.awk|*.sed|*.md)
            nvim "$file"
            ;;
        *)
            xdg-open "$file"  # Opens other file types with the default application
            ;;
    esac
}

# Execute the function with the provided argument
if [ "$#" -eq 1 ]; then
    open_file "$1"
else
    echo "Usage: $0 <file>"
    exit 1
fi
