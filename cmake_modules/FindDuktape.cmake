# Shamelessly stolen from:
# https://github.com/gwaldron/osgearth/blob/master/CMakeModules/FindDuktape.cmake

FIND_PATH(DUKTAPE_INCLUDE_DIR duktape.h
    ${DUKTAPE_DIR}/include
    $ENV{DUKTAPE_DIR}/include
    $ENV{DUKTAPE_DIR}
    ~/Library/Frameworks
    /Library/Frameworks
    /usr/local/include
    /usr/include
    /sw/include # Fink
    /opt/local/include # DarwinPorts
    /opt/csw/include # Blastwave
    /opt/include
    /usr/freeware/include
    /devel
)

FIND_LIBRARY(DUKTAPE_LIBRARY_RELEASE
  NAMES duktape
  PATHS
  ${DUKTAPE_DIR}
  ${DUKTAPE_DIR}/lib
  ${DUKTAPE_DIR}/build/Release/lib
  $ENV{DUKTAPE_DIR}
  $ENV{DUKTAPE_DIR}/lib
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local/lib
  /usr/lib
  /sw/lib
  /opt/local/lib
  /opt/csw/lib
  /opt/lib
  /usr/freeware/lib64
)

FIND_LIBRARY(DUKTAPE_LIBRARY_DEBUG
  NAMES duktaped
  PATHS
  ${DUKTAPE_DIR}
  ${DUKTAPE_DIR}/lib
  ${DUKTAPE_DIR}/build/Debug/lib
  $ENV{DUKTAPE_DIR}
  $ENV{DUKTAPE_DIR}/lib
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local/lib
  /usr/lib
  /sw/lib
  /opt/local/lib
  /opt/csw/lib
  /opt/lib
  /usr/freeware/lib64
)

SET(DUKTAPE_FOUND "NO")
IF(DUKTAPE_INCLUDE_DIR AND (DUKTAPE_LIBRARY_DEBUG OR DUKTAPE_LIBRARY_RELEASE))
    SET(DUKTAPE_FOUND "YES")
    IF(CMAKE_BUILD_TYPE EQUAL "DEBUG")
        SET(DUKTAPE_LIBRARY debug ${DUKTAPE_LIBRARY_DEBUG})
    ELSE()
        SET(DUKTAPE_LIBRARY optimized ${DUKTAPE_LIBRARY_RELEASE})
    ENDIF()
ENDIF(DUKTAPE_INCLUDE_DIR AND (DUKTAPE_LIBRARY_DEBUG OR DUKTAPE_LIBRARY_RELEASE))

