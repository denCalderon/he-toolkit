# Copyright (C) 2020-2021 Intel Corporation
# SPDX-License-Identifier: Apache-2.0

include(ExternalProject)

set(GFLAGS_GIT_REPO_URL https://github.com/gflags/gflags.git)
set(GFLAGS_GIT_LABEL v2.2.2)

ExternalProject_Add(
  ext_gflags
  PREFIX ext_gflags
  GIT_REPOSITORY ${GFLAGS_GIT_REPO_URL}
  GIT_TAG ${GFLAGS_GIT_LABEL}
  INSTALL_COMMAND ""
  UPDATE_COMMAND ""
  EXCLUDE_FROM_ALL TRUE)

# ------------------------------------------------------------------------------

ExternalProject_Get_Property(ext_gflags SOURCE_DIR BINARY_DIR)

add_library(libgflags INTERFACE)
add_dependencies(libgflags ext_gflags)
message(STATUS "libgflags include: ${BINARY_DIR}/include/")
message(STATUS "libgflags library: ${BINARY_DIR}/lib/")

target_include_directories(libgflags SYSTEM
                           INTERFACE ${BINARY_DIR}/include)
target_link_libraries(libgflags
                      INTERFACE ${BINARY_DIR}/lib/libgflags.a)
