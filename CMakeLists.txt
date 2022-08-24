cmake_minimum_required(VERSION 3.13)

project(kconfig_cmake
    VERSION     1.0
    DESCRIPTION "kconfig test project"
    LANGUAGES   C
)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
include(top)

# dymmy option for testing
if(CONFIG_TEST_OPTION)
    message("Config test_option enabled")
else(CONFIG_TEST_OPTION)
    message("Config test_option disabled")  
endif()


