# Submodule1

A component library providing core functionality in the modular software system.

## Overview

Submodule1 is a middleware component that bridges the master software with submodule1_1. It processes data received from submodule1_1 and exposes a simplified API for the master software to use.

## Features

- Simplified API for master software
- Dependency management for submodule1_1
- Standalone testing capability
- Unit test suite with Google Test

## Installation and Testing

### Prerequisites

- CMake 3.10 or higher
- C++14 compatible compiler
- Google Test (for running tests)
- Git (for dependency management)

### Building and Testing the Library

The easiest way to get started is to use the combined build and test script:

1. Clone the repository:

   ```
   git clone https://github.com/ruicongg/spectral-submodule1.git
   cd spectral-submodule1
   ```

2. Run the build and test script:

   ```
   ./build_and_test.sh
   ```

This script will:

- Automatically clone submodule1_1 dependency
- Generate necessary dependency headers
- Build the library and all test executables
- Run the unit tests
- Execute the test application
- Report the results

### Building Only

If you only want to build without running tests:

```
./build.sh
```

This will create:

- A static library `libsubmodule1.a`
- A test executable `submodule1_app`
- Unit tests executable `unit_tests`

### Manual Build Process

If you prefer to build manually, you can follow these steps:

```
# Clone dependency
mkdir -p deps
git clone https://github.com/ruicongg/spectral-submodule1-1 deps/submodule1_1

# Generate dependency header
cat > deps_generated.h << EOF
// Auto-generated dependency includes - DO NOT EDIT
#ifndef DEPS_GENERATED_H
#define DEPS_GENERATED_H

#include "deps/submodule1_1/submodule1_1.h"

#endif // DEPS_GENERATED_H
EOF

# Build
mkdir -p build
cd build
cmake ..
make
```

## Usage

### As a Dependency

To use Submodule1 in your project:

1. Add it to your project's dependencies in `config.json`:

   ```json
   "dependencies": [
       {
           "name": "submodule1",
           "path": "path/to/submodule1"
       }
   ]
   ```

2. Include the header in your code:

   ```cpp
   #include "submodule1.h"
   ```

3. Call the functions:
   ```cpp
   std::string data = submodule1::getInfo();
   std::string submoduleData = submodule1::getSubmoduleInfo();
   ```

### Standalone Testing

You can run the included test application to verify functionality:

```
./build/submodule1_app
```

### Running Unit Tests

To execute the unit test suite:

```
./build/unit_tests
```

## API Reference

The module provides the following functions:

### `std::string getInfo()`

Returns primary information from the module, combined with submodule data.

**Returns:**

- A string with combined data from this module and its submodule

**Side effects:**

- Prints "Submodule1 function called" to standard output

### `std::string getSubmoduleInfo()`

Returns information directly from submodule1_1.

**Returns:**

- A string with data from submodule1_1
