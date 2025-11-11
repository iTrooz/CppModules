cmake_minimum_required(VERSION 3.30...4.2)

# set(CMAKE_EXPERIMENTAL_CXX_IMPORT_STD 1942b4fa-b2c5-4546-9385-83f254070067)
# set(CMAKE_EXPERIMENTAL_CXX_IMPORT_STD a9e1cf81-9932-4810-974b-6eccaf14e457)
set(CMAKE_EXPERIMENTAL_CXX_IMPORT_STD d0edc3af-4c50-42ea-a356-e2862fe7a444)
set(CMAKE_CXX_SCAN_FOR_MODULES ON)
# Currently CMake requires extensions enabled when using import std.
# https://gitlab.kitware.com/cmake/cmake/-/issues/25916
# https://gitlab.kitware.com/cmake/cmake/-/issues/25539
set(CMAKE_CXX_EXTENSIONS ON)

project(CppModules LANGUAGES CXX)

enable_testing()

include(CheckCXXSymbolExists)


if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 23)
endif()

include(cmake/compilers.cmake)

if(HAVE_CXX_IMPORT_STD)
  add_executable(std_cout src/std_cout.cpp)
  set_property(TARGET std_cout PROPERTY CXX_MODULE_STD ON)

  add_test(NAME std_cout COMMAND std_cout)
endif()

add_executable(math_mod src/math.cpp)
# https://cmake.org/cmake/help/latest/command/target_sources.html#file-sets
target_sources(math_mod PUBLIC
FILE_SET my_math
TYPE CXX_MODULES
FILES src/math.ixx
)

# add_subdirectory(CLI11 EXCLUDE_FROM_ALL)
# target_link_libraries(math_mod CLI11::CLI11)

find_package(CLI11 CONFIG QUIET)
target_link_libraries(math_mod ${CLI11_LIBRARIES})

add_test(NAME MathModule COMMAND math_mod)


file(GENERATE OUTPUT .gitignore CONTENT "*")
