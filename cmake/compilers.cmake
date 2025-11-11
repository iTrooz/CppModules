include(CheckSourceCompiles)

if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
# /std:c++20 or newer implicitly enables modules
# https://learn.microsoft.com/en-us/cpp/build/reference/experimental-module
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 14.1)
  add_compile_options(-fmodules-ts)
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang" AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 17.0)
# -std=c++20 or higher implicitly enables modules
# https://releases.llvm.org/17.0.1/tools/clang/docs/StandardCPlusPlusModules.html#how-to-enable-standard-c-modules
endif()

check_source_compiles(CXX "import std;
int main() { return 0; }" HAVE_CXX_IMPORT_STD)
