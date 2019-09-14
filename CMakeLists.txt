cmake_minimum_required (VERSION 3.15)

## -----------------------------------------------------------------------------

## NOTE:  `CMake/Modules'  directory is located at the top level of the source
##   tree.
set (CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/CMake/Modules)

## -----------------------------------------------------------------------------

set (_PROJECT_NAME Pthreads-example CACHE INTERNAL "Project name" FORCE)
set (_PROJECT_VERSION 0.0.1.0 CACHE STRING "Target version" FORCE)

set (_TARGET_NAME pthreads-example CACHE STRING "Target name" FORCE)
set (_TARGET_PLATFORM MinGW-w64 CACHE STRING "Target platform" FORCE)

## -----------------------------------------------------------------------------

option (_DEBUG_MODE "Enable debug mode" TRUE)

## -----------------------------------------------------------------------------

## HACK:  `CMAKE_VERBOSE_MAKEFILE'  cache entry should be set as  `FORCE'd
##   because  `project'  command initializes it as  `FALSE'.
#set (CMAKE_VERBOSE_MAKEFILE TRUE CACHE BOOL "Enable verbose Makefile" FORCE)

## -----------------------------------------------------------------------------

project (${_PROJECT_NAME} VERSION ${_PROJECT_VERSION} LANGUAGES CXX)

## -----------------------------------------------------------------------------

## NOTE:  `CMAKE_VERBOSE_MAKEFILE'  cache entry should be set after calling
##   `project'  because  `project'  command initializes it as  `FALSE'.
if (_DEBUG_MODE)
  set (CMAKE_VERBOSE_MAKEFILE TRUE)
endif ()

## -----------------------------------------------------------------------------

add_subdirectory (sources)
