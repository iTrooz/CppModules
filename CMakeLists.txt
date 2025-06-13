cmake_minimum_required(VERSION 3.30...4.1)

# set(CMAKE_EXPERIMENTAL_CXX_IMPORT_STD 1942b4fa-b2c5-4546-9385-83f254070067)
# set(CMAKE_CXX_MODULE_STD ON)
set(CMAKE_CXX_SCAN_FOR_MODULES ON)

project(CppModules LANGUAGES CXX)

enable_testing()

include(CheckCXXSymbolExists)


if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 23)
endif()

include(cmake/compilers.cmake)

add_subdirectory(src)

file(GENERATE OUTPUT .gitignore CONTENT "*")
