cmake_minimum_required(VERSION 3.14)

project(em-odp-example)

add_definitions(-DEM_64_BIT -DENV_64_BIT)

find_package(PkgConfig REQUIRED)

pkg_check_modules(ODP REQUIRED IMPORTED_TARGET libodp-linux)
pkg_check_modules(ODP_HELPER REQUIRED IMPORTED_TARGET libodphelper)
pkg_check_modules(EM_ODP REQUIRED IMPORTED_TARGET libemodp)

file(GLOB COMMON_SRC "common/*.c")
add_executable(em-odp-example example.cpp ${COMMON_SRC})

target_link_libraries(em-odp-example PkgConfig::ODP PkgConfig::ODP_HELPER PkgConfig::EM_ODP)
