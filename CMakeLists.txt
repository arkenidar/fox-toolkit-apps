# cmake -S . -B build && cmake --build build && build/app

# Visual Studio Code IDE extension for CMake
# https://marketplace.visualstudio.com/items?itemName=ms-vscode.cmake-tools

# "cmake.generator": "Unix Makefiles" // gnu for linux: gnu is not unix
# "cmake.generator": "MinGW Makefiles" // mingw: minimal gnu for windows

cmake_minimum_required(VERSION 3.25)
project( app VERSION 0.1 )

#### file(GLOB SOURCE_FILES "*.c*" )
#### add_executable(app ${SOURCE_FILES})

find_package(PkgConfig REQUIRED)
pkg_check_modules( FX REQUIRED fox17)

file(GLOB SOURCE_FILES_HELLO "hello.cpp" )
add_executable(hello ${SOURCE_FILES_HELLO})
target_link_libraries(hello ${FX_LIBRARIES})
target_include_directories(hello PUBLIC ${FX_INCLUDE_DIRS})
target_compile_options(hello PUBLIC ${FX_CFLAGS_OTHER})

file(GLOB SOURCE_FILES_GLTEST "gltest.cpp" )
add_executable(gltest ${SOURCE_FILES_GLTEST})
target_link_libraries(gltest ${FX_LIBRARIES})
target_include_directories(gltest PUBLIC ${FX_INCLUDE_DIRS})
target_compile_options(gltest PUBLIC ${FX_CFLAGS_OTHER})

#### find_package( SDL2 REQUIRED )
#### target_link_libraries(${PROJECT_NAME} ${SDL2_LIBRARIES} )

#### find_package(SDL2_image REQUIRED)
#### target_link_libraries(${PROJECT_NAME} SDL2_image::SDL2_image)

find_package( OpenGL REQUIRED )
target_link_libraries(gltest OpenGL::GL OpenGL::GLU)
#define HAVE_GL_H // MY-ADD
#define HAVE_GLU_H // MY-ADD

# link with libm (math library), needed e.g. in GNU/Linux setting
target_link_libraries(gltest m)
