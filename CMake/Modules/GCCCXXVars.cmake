message (STATUS GCCCXXVars)

## NOTE:  For GCC 9.2.

set (_GCC_CXX_WARNINGS
  -fdiagnostics-color=auto
  -fdiagnostics-show-template-tree

  -Wpedantic
  -Wall
  -Wextra

  -Wdouble-promotion
  -Wformat-overflow=2
  -Wformat=2
  -Wformat-signedness
  -Wformat-truncation=2
  -Wnull-dereference  ## -fdelete-null-pointer-checks.
  -Wimplicit-fallthrough=5
  -Wmissing-include-dirs
  -Wmissing-profile
  -Wswitch-default
  -Wswitch-enum
  -Wunused-const-variable=2
  -Wstrict-aliasing=3  ## -fstrict-aliasing.
  -Wstrict-overflow=5  ## -fstrict-overflow.
  -Wstringop-overflow=4
  -Wstringop-truncation
  -Wsuggest-attribute=pure
  -Wsuggest-attribute=const
  -Wsuggest-attribute=noreturn
  -Wsuggest-attribute=format
  -Wmissing-format-attribute
  -Wsuggest-attribute=cold
  -Wsuggest-attribute=malloc
  -Wsuggest-final-types
  -Wsuggest-final-methods
  -Wsuggest-override
  -Walloc-zero
  -Walloca
  -Warray-bounds=2  ## -ftree-vrp.
  -Wattribute-alias=2
  -Wduplicated-branches
  -Wduplicated-cond
  -Wtrampolines
  -Wfloat-equal
  -Wshadow=global
  -Wunsafe-loop-optimizations  ## -funsafe-loop-optimizations.
  -Wplacement-new=2
  -Wundef
  -Wunused-macros
  -Wcast-qual
  -Wcast-align=strict
  -Wcatch-value=3
  -Wconditionally-supported
  -Wconversion
  -Wzero-as-null-pointer-constant
  -Wdate-time
  -Wuseless-cast
  -Wextra-semi
  -Wsign-conversion
  -Wsized-deallocation  ## -fsized-deallocation.
  -Wlogical-op
  -Waggregate-return
  -Waggressive-loop-optimizations  ## -faggressive-loop-optimizations.
  -Wmissing-declarations
  -Wopenmp-simd  ## -fsimd-cost-model=unlimited.
  -Wpacked
  -Wpadded
  -Wredundant-decls
  -Wrestrict
  -Winline
  -Winvalid-pch
  -Wvector-operation-performance
  -Wvla
  -Wdisabled-optimization
  -Wstack-protector  ## -fstack-protector.
  -Whsa

  CACHE INTERNAL
  "Extra GCC CXX warnings"
)

set (_GCC_CXX_OPTIONS
  -fdelete-null-pointer-checks
  -fstrict-aliasing
  -fstrict-overflow
  -ftree-vrp
  -funsafe-loop-optimizations
  -fsized-deallocation
  -faggressive-loop-optimizations
  # -fsimd-cost-model=unlimited
  -fstack-protector

  CACHE INTERNAL
  "Extra GCC CXX options"
)

set (_GCC_CXX_DIALECT_WARNINGS
  -Wabi-tag
  -Wctor-dtor-privacy
  -Wnoexcept
  -Wnoexcept-type
  -Wnon-virtual-dtor
  # -Weffc++
  -Wstrict-null-sentinel
  -Wold-style-cast
  -Woverloaded-virtual
  -Wsign-promo

  CACHE INTERNAL
  "Dialect-specific GCC CXX warnings"
)

set (_GCC_CXX_FP_SSE
  -ffp-contract=off
  -frounding-math
  -fsignaling-nans
  # -fno-fp-int-builtin-inexact

  -mfpmath=sse
  -msse2
  -mieee-fp
  -mpc64

  CACHE INTERNAL
  "SSE FP GCC CXX options"
)

set (_GCC_CXX_FP_X87
  -ffp-contract=off
  -frounding-math
  -fsignaling-nans
  # -fno-fp-int-builtin-inexact

  -mfpmath=387
  -mieee-fp
  -mpc80

  CACHE INTERNAL
  "x87 FP GCC CXX options"
)
