#!/usr/bin/env bash

# Script to run Gut tests in Godot
# This script can be used locally and in CI/CD

set -e

echo "Running Gut unit tests..."

# Check if Godot is available
if ! command -v godot &> /dev/null; then
    echo "Error: Godot not found in PATH"
    exit 1
fi

# Run tests using Gut
godot --headless -s addons/gut/gut_cmdln.gd -gexit

echo "Tests completed!"