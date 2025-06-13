if(HAVE_CXX_IMPORT_STD)
  add_executable(std_cout std_cout.cpp)

  add_test(NAME std_cout COMMAND std_cout)
endif()

add_executable(math_mod math.cpp)
# https://cmake.org/cmake/help/latest/command/target_sources.html#file-sets
target_sources(math_mod PUBLIC
FILE_SET my_math
TYPE CXX_MODULES
FILES math.ixx
)

add_test(NAME MathModule COMMAND math_mod)
