set(TARGET_NAME app)

set(SRC
    #startup
    ../../Devices/Esp32/startup.s

    #main
    main.c
)

add_library(${TARGET_NAME} STATIC ${SRC})
target_link_libraries(${TARGET_NAME} PRIVATE hal)