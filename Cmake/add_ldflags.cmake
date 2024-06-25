function(add_ldflags)

set(LINKER_FLAGS
	-specs=nosys.specs
	-lc
	-lm
	-lnosys
    -nostdlib
	-Wl,-Map=project.map,--cref
	-Wl,--gc-sections
	-Wl,--print-memory-usage
)

target_link_options(${EXECUTABLE} PRIVATE
	-T${PROJECT_SOURCE_DIR}/Device/${DEVICE}/linker.ld
	${LINKER_FLAGS}
)
    
endfunction()
