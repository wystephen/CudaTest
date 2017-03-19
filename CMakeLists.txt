cmake_minimum_required(VERSION 3.6)
project(CudaTest)
set(CMAKE_CXX_COMPILER "/usr/bin/g++-5")

FIND_PACKAGE(CUDA)

include_directories(
        CUDA_INCLUDE_DIRS
        /usr/include
)

message(${CUDA_INCLUDE_DIRS})

SET(CUDA_HOST_COMPILER /usr/bin/gcc-5)
set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES main.cpp)
add_executable(CudaTest ${SOURCE_FILES})


CUDA_ADD_EXECUTABLE(test_cuda test.cu)
