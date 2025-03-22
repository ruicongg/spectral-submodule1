#ifndef SUBMODULE1_H
#define SUBMODULE1_H

#include "deps_generated.h" // Auto-generated from config.json
#include <string>

namespace submodule1 {

// Main function that will be called by master_software
std::string getInfo();

// Function that calls submodule1_1
std::string getSubmoduleInfo();

} // namespace submodule1

#endif // SUBMODULE1_H