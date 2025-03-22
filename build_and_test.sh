#!/bin/bash

# Combined build and test script for submodule1
# Automates the complete build and test process with error handling

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Building and testing submodule1...${NC}"

# Setup dependencies recursively
echo "Setting up dependencies..."

# Make the dependency processor executable
chmod +x process_dependencies.sh

# Process dependencies recursively
./process_dependencies.sh || {
    echo -e "${RED}Failed to process dependencies${NC}"
    exit 1
}

# Create build directory if it doesn't exist
if [ ! -d "build" ]; then
    echo "Creating build directory..."
    mkdir -p build
fi

# Read project name from config.json
PROJECT_NAME=$(jq -r '.name' config.json)

# Navigate to build directory
cd build

# Configure with CMake
echo "Running CMake..."
cmake .. || { echo -e "${RED}CMake configuration failed${NC}"; exit 1; }

# Build
echo "Building..."
make || { echo -e "${RED}Build failed${NC}"; exit 1; }

# Run unit tests
echo "Running unit tests..."
./${PROJECT_NAME}_unit_tests || { echo -e "${RED}Unit tests failed${NC}"; exit 1; }

# Run test application
echo "Running test application..."
./${PROJECT_NAME}_app || { echo -e "${RED}Test application failed${NC}"; exit 1; }

# All succeeded
echo -e "${GREEN}All build and test processes completed successfully!${NC}"
echo ""
echo "Summary:"
echo "  - ${PROJECT_NAME} library was built"
echo "  - Dependencies were resolved recursively"
echo "  - Unit tests passed"
echo "  - Test application executed successfully"

# Return to original directory
cd .. 