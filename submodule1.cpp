#include "submodule1.h"
#include <iostream>

namespace submodule1 {

std::string getInfo() {
    std::cout << "Submodule1 function called" << std::endl;
    return "Submodule1 data + " + getSubmoduleInfo();
}

std::string getSubmoduleInfo() {
    return submodule1_1::getInfo();
}

} // namespace submodule1