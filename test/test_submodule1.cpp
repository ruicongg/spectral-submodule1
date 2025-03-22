#include "../submodule1.h"
#include <gtest/gtest.h>

// Test cases
TEST(Submodule1Test, GetInfo) {
    std::string info = submodule1::getInfo();
    EXPECT_FALSE(info.empty());
    EXPECT_NE(info.find("Submodule1 data"), std::string::npos);
}

TEST(Submodule1Test, GetSubmoduleInfo) {
    std::string info = submodule1::getSubmoduleInfo();
    EXPECT_FALSE(info.empty());
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}