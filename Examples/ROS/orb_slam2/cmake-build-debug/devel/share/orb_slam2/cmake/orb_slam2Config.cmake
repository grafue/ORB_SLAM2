# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^(debug|optimized|general)$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(orb_slam2_CONFIG_INCLUDED)
  return()
endif()
set(orb_slam2_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("TRUE" STREQUAL "TRUE")
  set(orb_slam2_SOURCE_PREFIX /home/grafue/catkin_ws/src/ORB_SLAM2/Examples/ROS/orb_slam2)
  set(orb_slam2_DEVEL_PREFIX /home/grafue/catkin_ws/src/ORB_SLAM2/Examples/ROS/orb_slam2/cmake-build-debug/devel)
  set(orb_slam2_INSTALL_PREFIX "")
  set(orb_slam2_PREFIX ${orb_slam2_DEVEL_PREFIX})
else()
  set(orb_slam2_SOURCE_PREFIX "")
  set(orb_slam2_DEVEL_PREFIX "")
  set(orb_slam2_INSTALL_PREFIX /usr/local)
  set(orb_slam2_PREFIX ${orb_slam2_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'orb_slam2' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(orb_slam2_FOUND_CATKIN_PROJECT TRUE)

if(NOT "/home/grafue/catkin_ws/src/ORB_SLAM2/Examples/ROS/orb_slam2/include;/home/grafue/catkin_ws/src/ORB_SLAM2/Examples/ROS/orb_slam2/../../../include;/home/grafue/catkin_ws/src/ORB_SLAM2/Examples/ROS/orb_slam2/../../..;/usr/include/opencv;/usr/include;/home/grafue/catkin_ws/src/Pangolin/include;/home/grafue/catkin_ws/src/Pangolin/build/src/include;/usr/include/eigen3 " STREQUAL " ")
  set(orb_slam2_INCLUDE_DIRS "")
  set(_include_dirs "/home/grafue/catkin_ws/src/ORB_SLAM2/Examples/ROS/orb_slam2/include;/home/grafue/catkin_ws/src/ORB_SLAM2/Examples/ROS/orb_slam2/../../../include;/home/grafue/catkin_ws/src/ORB_SLAM2/Examples/ROS/orb_slam2/../../..;/usr/include/opencv;/usr/include;/home/grafue/catkin_ws/src/Pangolin/include;/home/grafue/catkin_ws/src/Pangolin/build/src/include;/usr/include/eigen3")
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${orb_slam2_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'orb_slam2' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  Ask the maintainer 'Raul Mur-Artal <raulmur@unizar.es>' to fix it.")
      endif()
    else()
      message(FATAL_ERROR "Project 'orb_slam2' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '/home/grafue/catkin_ws/src/ORB_SLAM2/Examples/ROS/orb_slam2/${idir}'.  Ask the maintainer 'Raul Mur-Artal <raulmur@unizar.es>' to fix it.")
    endif()
    _list_append_unique(orb_slam2_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "/home/grafue/catkin_ws/src/ORB_SLAM2/Examples/ROS/orb_slam2/../../../lib/libORB_SLAM2.so;/home/grafue/catkin_ws/src/ORB_SLAM2/Examples/ROS/orb_slam2/../../../Thirdparty/g2o/lib/libg2o.so;/home/grafue/catkin_ws/src/ORB_SLAM2/Examples/ROS/orb_slam2/../../../Thirdparty/DBoW2/lib/libDBoW2.so;/opt/ros/indigo/lib/libimage_transport.so;/usr/lib/x86_64-linux-gnu/libtinyxml.so;/opt/ros/indigo/lib/libclass_loader.so;/usr/lib/libPocoFoundation.so;/usr/lib/x86_64-linux-gnu/libdl.so;/opt/ros/indigo/lib/libroslib.so;/opt/ros/indigo/lib/libcv_bridge.so;/opt/ros/indigo/lib/libtf.so;/opt/ros/indigo/lib/libtf2_ros.so;/opt/ros/indigo/lib/libactionlib.so;/opt/ros/indigo/lib/libmessage_filters.so;/opt/ros/indigo/lib/libroscpp.so;/usr/lib/x86_64-linux-gnu/libboost_signals.so;/usr/lib/x86_64-linux-gnu/libboost_filesystem.so;/opt/ros/indigo/lib/libxmlrpcpp.so;/opt/ros/indigo/lib/libtf2.so;/opt/ros/indigo/lib/libroscpp_serialization.so;/opt/ros/indigo/lib/librosconsole.so;/opt/ros/indigo/lib/librosconsole_log4cxx.so;/opt/ros/indigo/lib/librosconsole_backend_interface.so;/usr/lib/liblog4cxx.so;/usr/lib/x86_64-linux-gnu/libboost_regex.so;/opt/ros/indigo/lib/librostime.so;/usr/lib/x86_64-linux-gnu/libboost_date_time.so;/opt/ros/indigo/lib/libcpp_common.so;/usr/lib/x86_64-linux-gnu/libboost_system.so;/usr/lib/x86_64-linux-gnu/libboost_thread.so;/usr/lib/x86_64-linux-gnu/libpthread.so;/usr/lib/x86_64-linux-gnu/libconsole_bridge.so;/usr/lib/x86_64-linux-gnu/libopencv_videostab.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_superres.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_stitching.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_ocl.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_gpu.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_contrib.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8;/home/grafue/catkin_ws/src/Pangolin/build/src/libpangolin.so")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND orb_slam2_LIBRARIES ${library})
  elseif(TARGET ${library})
    list(APPEND orb_slam2_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND orb_slam2_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/grafue/catkin_ws/src/ORB_SLAM2/Examples/ROS/orb_slam2/cmake-build-debug/devel/lib;/home/grafue/catkin_ws/devel/lib;/opt/ros/indigo/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(orb_slam2_LIBRARY_DIRS ${lib_path})
      list(APPEND orb_slam2_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'orb_slam2'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND orb_slam2_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(orb_slam2_EXPORTED_TARGETS "")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${orb_slam2_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 orb_slam2_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${orb_slam2_dep}_FOUND)
      find_package(${orb_slam2_dep} REQUIRED)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${orb_slam2_dep} REQUIRED ${depend_list})
  endif()
  _list_append_unique(orb_slam2_INCLUDE_DIRS ${${orb_slam2_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(orb_slam2_LIBRARIES ${orb_slam2_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${orb_slam2_dep}_LIBRARIES})
  _list_append_deduplicate(orb_slam2_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(orb_slam2_LIBRARIES ${orb_slam2_LIBRARIES})

  _list_append_unique(orb_slam2_LIBRARY_DIRS ${${orb_slam2_dep}_LIBRARY_DIRS})
  list(APPEND orb_slam2_EXPORTED_TARGETS ${${orb_slam2_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${orb_slam2_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
