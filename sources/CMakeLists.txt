include (GCCCXXVars)

## -----------------------------------------------------------------------------

set (_TARGET_SOURCES
  main.cxx
)

add_executable (${_TARGET_NAME} ${_TARGET_SOURCES})

## -----------------------------------------------------------------------------

set_property (TARGET ${_TARGET_NAME} PROPERTY CXX_STANDARD 17)
set_property (TARGET ${_TARGET_NAME} PROPERTY CXX_STANDARD_REQUIRED TRUE)
set_property (TARGET ${_TARGET_NAME} PROPERTY CXX_EXTENSIONS TRUE)

set (_TARGET_COMPILE_OPTIONS
  -pipe

  -march=native
  -m64
)

set (_TARGET_COMPILE_OPTIONS_DEBUG
  -g
  -Og
)

target_compile_options (${_TARGET_NAME}
  PRIVATE
    ${_TARGET_COMPILE_OPTIONS}
    ${_TARGET_COMPILE_OPTIONS_DEBUG}
    ${_GCC_CXX_WARNINGS}
    ${_GCC_CXX_OPTIONS}
    ${_GCC_CXX_DIALECT_WARNINGS}
    ${_GCC_CXX_FP_SSE}
)

## -----------------------------------------------------------------------------

if (_DEBUG_MODE)
  set (_TARGET_COMPILE_DEFINITIONS_DEBUG
    _GLIBCXX_ASSERTIONS
    _GLIBCXX_DEBUG
    _GLIBCXX_DEBUG_PEDANTIC
  )
endif ()

target_compile_definitions (${_TARGET_NAME}
  PRIVATE
    ${_TARGET_COMPILE_DEFINITIONS_DEBUG}
)

## -----------------------------------------------------------------------------

set (_TARGET_LINK_OPTIONS
  -pthread

  -static
  -static-libgcc
  -static-libstdc++
)

target_link_options(${_TARGET_NAME}
  PRIVATE
    ${_TARGET_LINK_OPTIONS}
)
