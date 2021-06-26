# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "machines: 6 messages, 0 services")

set(MSG_I_FLAGS "-Imachines:/home/dhruv/MOS_ws/src/machines/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(machines_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Pneumatic.msg" NAME_WE)
add_custom_target(_machines_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "machines" "/home/dhruv/MOS_ws/src/machines/msg/Pneumatic.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/MAMcmd.msg" NAME_WE)
add_custom_target(_machines_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "machines" "/home/dhruv/MOS_ws/src/machines/msg/MAMcmd.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Conveyorcmd.msg" NAME_WE)
add_custom_target(_machines_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "machines" "/home/dhruv/MOS_ws/src/machines/msg/Conveyorcmd.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Sensor.msg" NAME_WE)
add_custom_target(_machines_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "machines" "/home/dhruv/MOS_ws/src/machines/msg/Sensor.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Conveyorstatus.msg" NAME_WE)
add_custom_target(_machines_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "machines" "/home/dhruv/MOS_ws/src/machines/msg/Conveyorstatus.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/MAMstatus.msg" NAME_WE)
add_custom_target(_machines_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "machines" "/home/dhruv/MOS_ws/src/machines/msg/MAMstatus.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(machines
  "/home/dhruv/MOS_ws/src/machines/msg/Pneumatic.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/machines
)
_generate_msg_cpp(machines
  "/home/dhruv/MOS_ws/src/machines/msg/MAMcmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/machines
)
_generate_msg_cpp(machines
  "/home/dhruv/MOS_ws/src/machines/msg/Conveyorcmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/machines
)
_generate_msg_cpp(machines
  "/home/dhruv/MOS_ws/src/machines/msg/Sensor.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/machines
)
_generate_msg_cpp(machines
  "/home/dhruv/MOS_ws/src/machines/msg/Conveyorstatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/machines
)
_generate_msg_cpp(machines
  "/home/dhruv/MOS_ws/src/machines/msg/MAMstatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/machines
)

### Generating Services

### Generating Module File
_generate_module_cpp(machines
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/machines
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(machines_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(machines_generate_messages machines_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Pneumatic.msg" NAME_WE)
add_dependencies(machines_generate_messages_cpp _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/MAMcmd.msg" NAME_WE)
add_dependencies(machines_generate_messages_cpp _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Conveyorcmd.msg" NAME_WE)
add_dependencies(machines_generate_messages_cpp _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Sensor.msg" NAME_WE)
add_dependencies(machines_generate_messages_cpp _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Conveyorstatus.msg" NAME_WE)
add_dependencies(machines_generate_messages_cpp _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/MAMstatus.msg" NAME_WE)
add_dependencies(machines_generate_messages_cpp _machines_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(machines_gencpp)
add_dependencies(machines_gencpp machines_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS machines_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(machines
  "/home/dhruv/MOS_ws/src/machines/msg/Pneumatic.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/machines
)
_generate_msg_eus(machines
  "/home/dhruv/MOS_ws/src/machines/msg/MAMcmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/machines
)
_generate_msg_eus(machines
  "/home/dhruv/MOS_ws/src/machines/msg/Conveyorcmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/machines
)
_generate_msg_eus(machines
  "/home/dhruv/MOS_ws/src/machines/msg/Sensor.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/machines
)
_generate_msg_eus(machines
  "/home/dhruv/MOS_ws/src/machines/msg/Conveyorstatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/machines
)
_generate_msg_eus(machines
  "/home/dhruv/MOS_ws/src/machines/msg/MAMstatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/machines
)

### Generating Services

### Generating Module File
_generate_module_eus(machines
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/machines
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(machines_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(machines_generate_messages machines_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Pneumatic.msg" NAME_WE)
add_dependencies(machines_generate_messages_eus _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/MAMcmd.msg" NAME_WE)
add_dependencies(machines_generate_messages_eus _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Conveyorcmd.msg" NAME_WE)
add_dependencies(machines_generate_messages_eus _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Sensor.msg" NAME_WE)
add_dependencies(machines_generate_messages_eus _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Conveyorstatus.msg" NAME_WE)
add_dependencies(machines_generate_messages_eus _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/MAMstatus.msg" NAME_WE)
add_dependencies(machines_generate_messages_eus _machines_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(machines_geneus)
add_dependencies(machines_geneus machines_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS machines_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(machines
  "/home/dhruv/MOS_ws/src/machines/msg/Pneumatic.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/machines
)
_generate_msg_lisp(machines
  "/home/dhruv/MOS_ws/src/machines/msg/MAMcmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/machines
)
_generate_msg_lisp(machines
  "/home/dhruv/MOS_ws/src/machines/msg/Conveyorcmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/machines
)
_generate_msg_lisp(machines
  "/home/dhruv/MOS_ws/src/machines/msg/Sensor.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/machines
)
_generate_msg_lisp(machines
  "/home/dhruv/MOS_ws/src/machines/msg/Conveyorstatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/machines
)
_generate_msg_lisp(machines
  "/home/dhruv/MOS_ws/src/machines/msg/MAMstatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/machines
)

### Generating Services

### Generating Module File
_generate_module_lisp(machines
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/machines
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(machines_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(machines_generate_messages machines_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Pneumatic.msg" NAME_WE)
add_dependencies(machines_generate_messages_lisp _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/MAMcmd.msg" NAME_WE)
add_dependencies(machines_generate_messages_lisp _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Conveyorcmd.msg" NAME_WE)
add_dependencies(machines_generate_messages_lisp _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Sensor.msg" NAME_WE)
add_dependencies(machines_generate_messages_lisp _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Conveyorstatus.msg" NAME_WE)
add_dependencies(machines_generate_messages_lisp _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/MAMstatus.msg" NAME_WE)
add_dependencies(machines_generate_messages_lisp _machines_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(machines_genlisp)
add_dependencies(machines_genlisp machines_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS machines_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(machines
  "/home/dhruv/MOS_ws/src/machines/msg/Pneumatic.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/machines
)
_generate_msg_nodejs(machines
  "/home/dhruv/MOS_ws/src/machines/msg/MAMcmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/machines
)
_generate_msg_nodejs(machines
  "/home/dhruv/MOS_ws/src/machines/msg/Conveyorcmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/machines
)
_generate_msg_nodejs(machines
  "/home/dhruv/MOS_ws/src/machines/msg/Sensor.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/machines
)
_generate_msg_nodejs(machines
  "/home/dhruv/MOS_ws/src/machines/msg/Conveyorstatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/machines
)
_generate_msg_nodejs(machines
  "/home/dhruv/MOS_ws/src/machines/msg/MAMstatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/machines
)

### Generating Services

### Generating Module File
_generate_module_nodejs(machines
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/machines
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(machines_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(machines_generate_messages machines_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Pneumatic.msg" NAME_WE)
add_dependencies(machines_generate_messages_nodejs _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/MAMcmd.msg" NAME_WE)
add_dependencies(machines_generate_messages_nodejs _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Conveyorcmd.msg" NAME_WE)
add_dependencies(machines_generate_messages_nodejs _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Sensor.msg" NAME_WE)
add_dependencies(machines_generate_messages_nodejs _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Conveyorstatus.msg" NAME_WE)
add_dependencies(machines_generate_messages_nodejs _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/MAMstatus.msg" NAME_WE)
add_dependencies(machines_generate_messages_nodejs _machines_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(machines_gennodejs)
add_dependencies(machines_gennodejs machines_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS machines_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(machines
  "/home/dhruv/MOS_ws/src/machines/msg/Pneumatic.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/machines
)
_generate_msg_py(machines
  "/home/dhruv/MOS_ws/src/machines/msg/MAMcmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/machines
)
_generate_msg_py(machines
  "/home/dhruv/MOS_ws/src/machines/msg/Conveyorcmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/machines
)
_generate_msg_py(machines
  "/home/dhruv/MOS_ws/src/machines/msg/Sensor.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/machines
)
_generate_msg_py(machines
  "/home/dhruv/MOS_ws/src/machines/msg/Conveyorstatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/machines
)
_generate_msg_py(machines
  "/home/dhruv/MOS_ws/src/machines/msg/MAMstatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/machines
)

### Generating Services

### Generating Module File
_generate_module_py(machines
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/machines
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(machines_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(machines_generate_messages machines_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Pneumatic.msg" NAME_WE)
add_dependencies(machines_generate_messages_py _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/MAMcmd.msg" NAME_WE)
add_dependencies(machines_generate_messages_py _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Conveyorcmd.msg" NAME_WE)
add_dependencies(machines_generate_messages_py _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Sensor.msg" NAME_WE)
add_dependencies(machines_generate_messages_py _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/Conveyorstatus.msg" NAME_WE)
add_dependencies(machines_generate_messages_py _machines_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dhruv/MOS_ws/src/machines/msg/MAMstatus.msg" NAME_WE)
add_dependencies(machines_generate_messages_py _machines_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(machines_genpy)
add_dependencies(machines_genpy machines_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS machines_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/machines)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/machines
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(machines_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/machines)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/machines
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(machines_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/machines)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/machines
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(machines_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/machines)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/machines
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(machines_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/machines)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/machines\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/machines
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(machines_generate_messages_py std_msgs_generate_messages_py)
endif()
