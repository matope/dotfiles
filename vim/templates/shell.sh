#!/bin/bash
set -e
set -o pipefail

# Variables
SCRIPT_NAME="$(basename "$0")"

# Functions
usage() {
    echo "Usage: ${SCRIPT_NAME} [options] <arg1> <arg2>"
    echo
    echo "Description:"
    echo "  This script demonstrates a nice Bash template for your own scripts."
    echo
    echo "Options:"
    echo "  -h, --help        Show this help message and exit"
    echo "  -v, --verbose     Enable verbose output"
    echo
    echo "Arguments:"
    echo "  arg1              Description for argument 1"
    echo "  arg2              Description for argument 2"
    exit 1
}

error() {
    echo "${SCRIPT_NAME}: $1" >&2
    exit 1
}

# Argument parsing
VERBOSE=false
while [ "$#" -gt 0 ]; do
    case "$1" in
        -h|--help)
            usage
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        *)
            if [ -z "$ARG1" ]; then
                ARG1="$1"
            elif [ -z "$ARG2" ]; then
                ARG2="$1"
            else
                error "Unknown argument: $1"
            fi
            shift
            ;;
    esac
done

# Check if required arguments are set
if [ -z "$ARG1" ] || [ -z "$ARG2" ]; then
    usage
fi

# Main script logic
if [ "$VERBOSE" = true ]; then
    echo "Verbose mode is enabled"
fi

echo "Argument 1: $ARG1"
echo "Argument 2: $ARG2"

# Add your script logic here
