set(EXECUTABLE app.elf)

include(${PROJECT_SOURCE_DIR}/Cmake/add_cflags.cmake)
include(${PROJECT_SOURCE_DIR}/Cmake/add_ldflags.cmake)

set(SRC
    #startup
    ${PROJECT_SOURCE_DIR}/Device/${DEVICE}/startup.s

    #main
    ${MAIN_REL_PATH}/main.c
)

add_cflags()

add_executable(${EXECUTABLE} ${SRC})
target_link_libraries(${EXECUTABLE} PRIVATE hal)

add_ldflags()

add_custom_command(TARGET ${EXECUTABLE}
	POST_BUILD
	COMMAND ${CMAKE_OBJCOPY} -O ihex app.elf app.hex
	COMMAND ${CMAKE_OBJCOPY} -O binary app.elf app.bin
)