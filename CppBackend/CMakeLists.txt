cmake_minimum_required(VERSION 3.22)
project(CppBackend CUDA CXX)

set(CMAKE_CUDA_STANDARD 11)
set(CMAKE_CXX_STANDARD 11)

add_executable(CppBackend entry.cu classes/image.cpp classes/rendering/Scene/primitives/ray.cu classes/rendering/Scene/primitives/triangle.cu classes/rendering/Scene/primitives/vector3.cu pipelineComponents/renderPipelines/superPipeline.cpp pipelineComponents/IPC/SuperIPC.cpp pipelineComponents/IPC/DartIPC/DartIPC.cpp)

include_directories("include/plog/include")

set_target_properties(CppBackend PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)

find_package(OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})
target_link_libraries(CppBackend ${OpenCV_LIBS})




target_compile_options(CppBackend PRIVATE $<$<COMPILE_LANGUAGE:CUDA>:-x=cu -ccbin=g++-10>)

