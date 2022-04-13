
FIND_PACKAGE(CMLIB
    COMPONENTS STORAGE
    REQUIRED
)

#
# Add package by a name specified in the registry:
#   https://gitlab.bringauto.com/bringauto-public/fleet-package-repository
#
# nlohman-json library does not differ between Release and Debug configuration,
# That's why we need to explicitly tell the BA_PACKAGE - "nlohman-json has no debug version of the lib" .
#
# Otherwise the curl has a shared library and it differs between Debug and Release
#
BA_PACKAGE_LIBRARY(nlohmann-json v3.10.5 PLATFORM_STRING_MODE any_machine NO_DEBUG ON)
BA_PACKAGE_LIBRARY(curl          v7.79.1)
BA_PACKAGE_LIBRARY(zlib          v1.2.11 OUTPUT_PATH_VAR ZLIB_ROOT)

# Do not find packages in the system
SET(CMAKE_FIND_USE_CMAKE_SYSTEM_PATH FALSE)

