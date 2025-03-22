#include "submodule1.h"
#include <iostream>

int main() {
    std::cout << "Testing Submodule1" << std::endl;
    std::cout << "Info: " << submodule1::getInfo() << std::endl;
    std::cout << "Submodule Info: " << submodule1::getSubmoduleInfo() << std::endl;
    return 0;
}