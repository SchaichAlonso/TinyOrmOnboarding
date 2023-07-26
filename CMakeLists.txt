cmake_minimum_required(VERSION 3.24)

project(TinyORMOnboarding CXX)

find_package(PNG REQUIRED)

add_executable(main)
target_sources(main PRIVATE main.cpp)
target_link_libraries(main PRIVATE PNG::PNG)
