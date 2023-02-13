cmake_minimum_required(VERSION 3.15)
set(CMAKE_CXX_STANDARD 14)
project (boost_example)
FIND_PACKAGE(Boost COMPONENTS program_options REQUIRED)
INCLUDE_DIRECTORIES(${Boost_INCLUDE_DIR})
ADD_EXECUTABLE(boost_example main_test.cpp)
TARGET_LINK_LIBRARIES(boost_example LINK_PUBLIC ${Boost_LIBRARIES})

