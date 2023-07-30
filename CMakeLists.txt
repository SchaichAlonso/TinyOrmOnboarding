cmake_minimum_required(VERSION 3.24)

project(TinyORMOnboarding CXX)

find_package(Qt6 REQUIRED COMPONENTS Concurrent Core Sql Test)
qt_standard_project_setup()

find_package(TinyOrm CONFIG REQUIRED)

add_executable(MyTest)
target_sources(MyTest PRIVATE MyTinyTest.cpp)
target_link_libraries(MyTest PRIVATE Qt::Core Qt::Test TinyOrm::TinyOrm)
