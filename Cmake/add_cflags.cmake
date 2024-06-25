function(add_cflags)

# Config Extra options
# (https://gcc.gnu.org/onlinedocs/gcc/Code-Gen-Options.html)
# (https://gcc.gnu.org/onlinedocs/gcc-2.95.2/gcc_2.html#SEC10)

set(EXTRA_OPTIONS
	-fdata-sections			    # Place each function or data item into its own
							    # section in the output file if the target supports
							    # arbitrary sections.

	-ffunction-sections		    # Place each function or data item into its own
							    # section in the output file if the target supports
							    # arbitrary sections.

	-fno-common				    # Allocate even uninitialized global variables in
							    # the bss section of the object file, rather than
							    # generating them as common blocks.

	-fno-tree-loop-if-convert	# refrain from converting conditional branches inside
                                # loops into equivalent branch-free code

	-fno-merge-constants	    # do not attempt to merge identical constants
							    # (string constants and floating-point constants)
							    # across compilation units.

	-fshort-enums			    # Allocate to an enum type only as many bytes as it
							    # needs for the declared range of possible values.

	-fno-math-errno			    # Do not set ERRNO after calling math functions that
							    # are executed with a single instruction, e.g., sqrt.
							    # A program that relies on IEEE exceptions for math
							    # error handling may want to use this flag for speed
							    # while maintaining IEEE arithmetic compatibility.
)

# Config debug info
set(DEBUG_INFO
	-g3
	-gdwarf-2
)

# Config dependancy
set(DEPENDENCY_INFO
	-MMD
	-MP
	-MF "$(@:%.0=%.d)"
)

#	Config warnings
# (https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html)
set(WARNING_OPTIONS
	-Wall					# Enable all warnings.

	-Wextra					# Enable extra warning flash which are not enabled by
							# -Wall.

	-Wstack-usage=256		# Warn if the stack usage of a function might exceed
							# ceratin value.

	-Wshadow				# Warn whenever a local variable or type declaration
							# shadowsnother variable, parameter, type,
							# class member (in C++),
							# or instance variable (in Objective-C) or whenever a
							# built-in function is shadowed.

	-Wdouble-promotion		# Give a warning when a value of type float is
							# implicitly promoted to double.

	-Wno-unused-parameter	# surpress "unused" variable warnings

	-Wno-unused-function	# surpress "unused" function warnings

	-Wno-enum-conversion	# surpress enum conversion warning
)

# Configure optimization levels

if(CMAKE_BUILD_TYPE STREQUAL Debug)
    set(OPT -Og)
elseif(CMAKE_BUILD_TYPE STREQUAL Release)
    set(OPT -O3)
endif()

# Add compile options

add_compile_options(
	${EXTRA_OPTIONS}
	${DEBUG_INFO}
	${DEPENDENCY_INFO}
	${WARNING_OPTIONS}
	${OPT}
)

endfunction()