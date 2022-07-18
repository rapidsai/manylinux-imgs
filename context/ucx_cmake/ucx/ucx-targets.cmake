#
# Copyright (C) NVIDIA Corporation. 2021.  ALL RIGHTS RESERVED.
#
# See file LICENSE for terms.
#

set(prefix "/usr")
set(exec_prefix "${prefix}")

add_library(ucx::ucs SHARED IMPORTED)

set_target_properties(ucx::ucs PROPERTIES
  IMPORTED_LOCATION "${exec_prefix}/lib64/libucs.so"
  INTERFACE_INCLUDE_DIRECTORIES "${prefix}/include"
)

add_library(ucx::ucp SHARED IMPORTED)

set_target_properties(ucx::ucp PROPERTIES
  IMPORTED_LOCATION "${exec_prefix}/lib64/libucp.so"
  INTERFACE_INCLUDE_DIRECTORIES "${prefix}/include"
)

add_library(ucx::uct SHARED IMPORTED)

set_target_properties(ucx::uct PROPERTIES
  IMPORTED_LOCATION "${exec_prefix}/lib64/libuct.so"
  INTERFACE_INCLUDE_DIRECTORIES "${prefix}/include"
)
