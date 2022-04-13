
IF(BRINGAUTO_TESTS)
    MESSAGE(WARNING "Project has no tests!")
ENDIF()
    
# Delete FORCE once the tests are implemented
SET(BRINGAUTO_TESTS OFF
    CACHE BOOl
    "Enable/disable tests"
    FORCE
)

IF(BRINGAUTO_SAMPLES)
    MESSAGE(WARNING "Project has no samples!")
ENDIF()
    
# Delete FORCE once the tests are implemented
SET(BRINGAUTO_SAMPLES OFF
    CACHE BOOl
    "Enable/disable samples"
    FORCE
)

SET(BRINGAUTO_SYSTEM_DEP OFF
    CACHE BOOl
    "Enable/disable using system dependencies. If OFF we use BringAuto Package Tracker to download dependencies"
)
    
SET(BRINGAUTO_INSTALL ON
    CACHE BOOl
    "Enable/disable project INSTALL"
)
SET(BRINGAUTO_PACKAGE ON
    CACHE BOOl
    "Enable/disable project INSTALL"
)
IF(BRINGAUTO_PACKAGE AND NOT BRINGAUTO_INSTALL)
    SET(BRINGAUTO_INSTALL ON
        CACHE BOOl
        "Enable/disable project INSTALL"
        FORCE
    )
    MESSAGE(WARNING "BRINGAUTO_PACKAGE is ON, switching BRINGAUTO_INSTALL to ON!")
ENDIF()

