set (_TARGET_SOURCES
  main.cxx
)

add_executable (${_TARGET_NAME} ${_TARGET_SOURCES})

## -----------------------------------------------------------------------------

set_property (TARGET ${_TARGET_NAME} PROPERTY CXX_STANDARD 17)
set_property (TARGET ${_TARGET_NAME} PROPERTY CXX_STANDARD_REQUIRED TRUE)
set_property (TARGET ${_TARGET_NAME} PROPERTY CXX_EXTENSIONS TRUE)

set (_TARGET_COMPILE_OPTS
  -march=native
  -static
  -static-libgcc
  -static-libstdc++
)

set (_TARGET_COMPILE_OPTS_DEBUG
  -g
  -O0
)

set (_TARGET_COMPILE_OPTS_WARNINGS
  -fdiagnostics-color=auto

  -Wpedantic
  -Wall
  -Wextra
  -Wdouble-promotion
  -Wformat=2
  -Wformat-signedness
)

set (_TARGET_COMPILE_OPTS_DIAGNOSTICS
#  -Wno-coverage-mismatch
  -Wnull-dereference
  -Wmissing-include-dirs
  -Wuninitialized
#  -Wstrict-overflow=5
  -Wsuggest-attribute=pure
  -Wsuggest-attribute=const
  -Wsuggest-attribute=noreturn
  -Wsuggest-attribute=format
  -Wmissing-format-attribute
  -Wsuggest-final-types
  -Wsuggest-final-methods
  -Wsuggest-override
  -Warray-bounds=2
  -Wduplicated-branches
  -Wduplicated-cond
#  -Wtrampolines
  -Wfloat-equal
#  -Wundef
#  -Wshadow
  -Wunsafe-loop-optimizations
  -Wplacement-new=2
  -Wcast-qual
  -Wcast-align
  -Wconditionally-supported
  -Wconversion
#  -Wzero-as-null-pointer-constant
  -Wdate-time
  -Wuseless-cast
  -Wsign-conversion
  -Wlogical-op
  -Wno-aggressive-loop-optimizations
#  -Wmissing-declarations
  -Wopenmp-simd
  -Wpacked
#  -Wpadded
  -Wredundant-decls
  -Wrestrict
  -Winline
  -Winvalid-pch
  -Wvector-operation-performance
  -Wvla
  -Wstack-protector
  -Whsa
  -Wabi
#  -Wabi-tag
  -Wctor-dtor-privacy
  -Wnoexcept
  -Wnon-virtual-dtor
#  -Weffc++
  -Wstrict-null-sentinel
  -Wno-non-template-friend
  -Wold-style-cast
  -Woverloaded-virtual
  -Wsign-promo
)

set (_TARGET_COMPILE_OPTS_DIAGNOSTICS_2
  -fdiagnostics-color=auto

  -Wpedantic
  -Wall
  -Wextra

  -Wchkp  ## -fcheck-pointer-bounds.
  -Wdouble-promotion
  -Wformat=2
  -Wformat-overflow=2
  -Wformat-signedness
  -Wformat-truncation=2
  -Wnull-dereference  ## -fdelete-null-pointer-checks.
  -Wimplicit-fallthrough=5
  -Wmissing-include-dirs
  -Wshift-overflow=2
  -Wswitch-default
  -Wswitch-enum
  -Wstrict-aliasing=3  ## -fstrict-aliasing.
  -Wstrict-overflow=4  ## -fstrict-overflow.
  -Wstringop-overflow=3
  -Wsuggest-attribute=pure
  -Wsuggest-attribute=const
  -Wsuggest-attribute=noreturn
  -Wsuggest-attribute=format
  -Wmissing-format-attribute
  -Wsuggest-final-types
  -Wsuggest-final-methods
  -Wsuggest-override
  -Walloc-zero
  -Walloca
  -Warray-bounds=1
  -Wduplicated-branches
  -Wduplicated-cond
  -Wtrampolines
  -Wfloat-equal
  -Wshadow=compatible-local
  -Wunsafe-loop-optimizations # -funsafe-loop-optimizations
  -Waligned-new=all
  -Wplacement-new=2
#  -Wundef
  -Wcast-qual
  -Wcast-align
  -Wwrite-strings
  -Wconditionally-supported
  -Wconversion
  -Wzero-as-null-pointer-constant
  -Wdate-time
  -Wuseless-cast
  -Wsign-conversion
  -Wfloat-conversion
  -Wsized-deallocation  ## -fsized-deallocation.
  -Wlogical-op
#  -Wmissing-declarations
  -Wopenmp-simd  ## -fsimd-cost-model=unlimited.
  -Wpacked
#  -Wpadded
  -Wredundant-decls
  -Wrestrict
  -Winline
  -Winvalid-pch
  -Wvector-operation-performance
  -Wdisabled-optimization
  -Wstack-protector  ## -fstack-protector.
  -Whsa

  -Wabi
#  -Wabi-tag
  -Wctor-dtor-privacy
  -Wdelete-non-virtual-dtor
  -Wnoexcept
  -Wnon-virtual-dtor
  -Wreorder
  -Wstrict-null-sentinel
  -Wold-style-cast
  -Woverloaded-virtual
  -Wsign-promo
)

target_compile_options (${_TARGET_NAME}
  PRIVATE
    ${_TARGET_COMPILE_OPTS}
    ${_TARGET_COMPILE_OPTS_DEBUG}
    ${_TARGET_COMPILE_OPTS_DIAGNOSTICS_2}
)

## -----------------------------------------------------------------------------

set (_TARGET_DEFINITIONS_DEBUG
  _GLIBCXX_ASSERTIONS
  _GLIBCXX_DEBUG
  _GLIBCXX_DEBUG_PEDANTIC
)

target_compile_definitions (${_TARGET_NAME}
  PRIVATE
    ${_TARGET_DEFINITIONS_DEBUG}
)
