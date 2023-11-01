cmake_minimum_required(VERSION 3.22)
project(CppBackend CXX CUDA )

set(CMAKE_CUDA_STANDARD 11)
set(CMAKE_CXX_STANDARD 11)

#Define a variable for sources, glob all recursively except the files in the include folder
file(GLOB_RECURSE SOURCES "src/*.cpp" "src/*.cu" "src/*.h" "src/*.hpp" "src/*.cuh")

add_executable(CppBackend)

include_directories("include/plog/include")

set_target_properties(CppBackend PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)

target_include_directories(CppBackend PUBLIC src)

find_package(OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})
target_link_libraries(CppBackend ${OpenCV_LIBS})

target_sources(CppBackend PRIVATE ${SOURCES})
target_compile_options(CppBackend PRIVATE $<$<COMPILE_LANGUAGE:CUDA>:-x=cu -ccbin=g++-10>)