# https://github.com/franko/fox => install this to have fox17 below.

# - in MinGW for MSYS for Windows (GNU for Windows). (tested in: Windows-OS).
# - in GNU Linux software-distribution (GNU for Linux). (tested in: Debian-OS).

# make && ./a.*

## g++ gltest.cpp $(shell pkgconf --cflags --libs fox17 ) -lopengl32 -lglu32

all: gltest

gltest:
ifeq (Linux,$(shell uname))
	g++ -g -Wall gltest.cpp $(shell pkgconf --cflags --libs fox17 ) -lGL -lGLU
else
	g++ -g -Wall gltest.cpp $(shell pkgconf --cflags --libs fox17 ) -lopengl32 -lglu32 -mwindows
endif	
