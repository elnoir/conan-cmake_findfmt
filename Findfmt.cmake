

message(STATUS "Conan: Using custom Findfmt.cmake")
# Global approach
set(fmt_FOUND 1)
set(fmt_VERSION "5.3.0")

find_package_handle_standard_args(fmt REQUIRED_VARS fmt_VERSION VERSION_VAR fmt_VERSION)
mark_as_advanced(fmt_FOUND fmt_VERSION)

set(fmt_INCLUDE_DIRS ${CONAN_INCLUDE_DIRS_FMT})
set(fmt_INCLUDES ${CONAN_INCLUDE_DIRS_FMT})
set(fmt_DEFINITIONS )
set(fmt_LINKER_FLAGS_LIST "" "")  
set(fmt_COMPILE_DEFINITIONS )
set(fmt_COMPILE_OPTIONS_LIST "" "")
set(fmt_LIBRARIES ${CONAN_LIBS_FMT}) # Will be filled later
set(fmt_LIBS ${CONAN_LIBS_FMT}) # Same as fmt_LIBRARIES

mark_as_advanced(fmt_INCLUDE_DIRS 
                 fmt_INCLUDES
                 fmt_DEFINITIONS
                 fmt_LINKER_FLAGS_LIST 
                 fmt_COMPILE_DEFINITIONS
                 fmt_COMPILE_OPTIONS_LIST
                 fmt_LIBRARIES 
                 fmt_LIBS
                 fmt_LIBRARIES_TARGETS)

if(NOT ${CMAKE_VERSION} VERSION_LESS "3.0")
    # Target approach
    if(NOT TARGET fmt::fmt)
        add_library(fmt::fmt INTERFACE IMPORTED)
		if(fmt_INCLUDE_DIRS)
		  set_target_properties(fmt::fmt PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${fmt_INCLUDE_DIRS}")
		endif()
		target_link_libraries(fmt::fmt INTERFACE CONAN_PKG::fmt)
    endif()
endif()
