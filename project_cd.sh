#!/bin/bash

# Function to display help information
show_help() {
    echo "Usage: project_cd.sh [PROJECT_NAME]"
    echo "Change directory to the project folder"
    echo "PROJECT_NAME: Name of the project folder"
    echo "Options:"
    echo "  inflation-borrowing or inflation"
    echo "  LSE or lse"
    echo "  Maarten"
    echo "  default-intangible or default"
    echo "  granular-search-growth or gsg"
    echo "  granular-search or gs"
    echo "  front-fixing or ff"
}

# Check if no argument or help flag is passed
if [[ "$1" == "--help" || "$1" == "-h" || -z "$1" ]]; then
    show_help
    exit 0
fi

PROJECT_NAME=$1
#echo "Project name: $PROJECT_NAME"

case "$PROJECT_NAME" in
    inflation|inflation-borrowing)
        cd "/home/stephan/Documents/LSE/inflation-borrowing"
        ;;

    lse|LSE)
        cd "/home/stephan/Documents/LSE/"
        ;;
    
    Maarten)
        cd "/home/stephan/Documents/LSE/RA/Maarten 2024/"
        ;;

    default|default-intangible)
        cd "/home/stephan/Documents/LSE/Default/default-intangibles/"
        ;;

    gsg|granular-search-growth)
        cd "/home/stephan/Documents/LSE/granular-search-growth/"
        ;;

    gs|granular-search)
        cd "/home/stephan/Documents/LSE/Year 2/MRes Paper/"
        ;;

    ff|front-fixing)
        cd "/home/stephan/Documents/LSE/front-fixing/"
        ;;

    *)
        echo "Project not found"
        exit 1
        ;;

esac


