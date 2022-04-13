#
# BringAuto CXX Project temple.
#
#

PROJECT(BA_PROJECT_NAME CXX)
CMAKE_MINIMUM_REQUIRED(VERSION 3.18)

INCLUDE(cmake/Settings.cmake)

#
# We initialize CMLIB library.
# If you do not have one just follow https://github.com/cmakelib/cmakelib
#
FIND_PACKAGE(CMLIB
    COMPONENTS CMDEF STORAGE
    REQUIRED
)

IF(BRINGAUTO_SYSTEM_DEP)
    INCLUDE(cmake/Dependencies.cmake)
ENDIF()

#
# After package add we can use standard FIND_LIBRARY
# as a documented by the package upstream
#
FIND_PACKAGE(nlohmann_json REQUIRED)
FIND_PACKAGE(CURL          REQUIRED)

# We need to update RPATH to install path of dependencicies
SET(CMAKE_INSTALL_RPATH "$ORIGIN/../lib")

# We do not need to use CMDEF_LIBRARY,
# because we do not want to include library in the package
ADD_LIBRARY(balib STATIC source/bringauto/Lib.cpp)
TARGET_INCLUDE_DIRECTORIES(balib PUBLIC include/)
TARGET_LINK_LIBRARIES(balib PUBLIC nlohmann_json::nlohmann_json CURL::libcurl)

CMDEF_ADD_EXECUTABLE(
    TARGET test
    SOURCES main.cpp
    VERSION 1.8.5
)
TARGET_LINK_LIBRARIES(test PUBLIC balib)


IF(BRINGAUTO_INSTALL)
    # Install created target
    CMDEF_INSTALL(TARGET test)

    # Install all shared library dependencies needed for json_target
    # and update RUNPATH.
    BA_PACKAGE_DEPS_IMPORTED(test)
ENDIF()

IF(BRINGAUTO_PACKAGE)
    # Create a package
    CMDEF_PACKAGE(
        MAIN_TARGET test
        VERSION     1.0.9
    )

    SET(CPACK_GENERATOR ZIP)
    INCLUDE(CPack)
ENDIF()