
set(DOTCONFIG_FILEPATH     ${CMAKE_SOURCE_DIR}/configs/.config)
set(KCONFIG_FILEPATH       ${CMAKE_SOURCE_DIR}/configs/Kconfig)
set(KCONFIGLIB_PATH        ${CMAKE_SOURCE_DIR}/python_scripts/kconfiglib)

set(ENV{PYTHON_EXECUTABLE}  ${PYTHON_EXECUTABLE})

add_custom_target(guiconfig ALL)
add_custom_target(menuconfig ALL)

add_custom_command(
  TARGET   guiconfig
  COMMAND  export KCONFIG_CONFIG=${DOTCONFIG_FILEPATH}
  COMMAND  cd ${KCONFIGLIB_PATH}
  COMMAND  ${PYTHON_EXECUTABLE} guiconfig.py ${KCONFIG_FILEPATH}
)

add_custom_command(
  TARGET   menuconfig
  COMMAND  USES_TERMINAL
  COMMAND  export KCONFIG_CONFIG=${DOTCONFIG_FILEPATH}
  COMMAND  cd ${KCONFIGLIB_PATH}
  COMMAND  ${PYTHON_EXECUTABLE} menuconfig.py ${KCONFIG_FILEPATH}
)

# parse th .config file and include definitions as cmake variables
import_kconfig(CONFIG_ ${DOTCONFIG_FILEPATH})

