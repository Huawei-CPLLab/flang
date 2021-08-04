#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#

set(ENV{LC_ALL} "C")

add_executable(upperl
  upperl.c
  )

# Generate upper tables
get_property(cdefs DIRECTORY PROPERTY COMPILE_DEFINITIONS)
list(TRANSFORM cdefs PREPEND "-D")

add_custom_command( 
  OUTPUT ${UTILS_UPPER_BIN_DIR}/upperilm.h
  COMMAND "${CMAKE_C_COMPILER}" -E -P -x c ${cdefs} ${UTILS_UPPER_DIR}/upperilm.in | LC_ALL=C sort > ${UTILS_UPPER_BIN_DIR}/upperilm.sort
  COMMAND ${CMAKE_BINARY_DIR}/bin/upperl ${UTILS_UPPER_BIN_DIR}/upperilm.sort ${UTILS_UPPER_BIN_DIR}/upperilm.h
  DEPENDS upperl ${UTILS_UPPER_DIR}/upperilm.in
  )

add_custom_target(gen_backend_upper
  SOURCES ${UTILS_UPPER_BIN_DIR}/upperilm.h
  )
