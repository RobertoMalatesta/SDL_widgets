CC=g++
CFLAGS=-g -O $$(sdl-config --cflags) -std=c++0x \
  -Wall -Wuninitialized -Wshadow -Wno-non-virtual-dtor -Wno-delete-non-virtual-dtor -Wno-multichar -fmax-errors=5
OBJ=testsw.o sdl-widgets.o

.SUFFIXES=
.PHONY: all hello make-waves bouncy-tune

all: testsw hello make-waves bouncy-tune

testsw: $(OBJ)
	$(CC) $(OBJ) -o $@ $$(sdl-config --libs) -lSDL_gfx -lSDL_ttf

%.o: %.cpp
	$(CC) -c $< $(CFLAGS)

hello make-waves bouncy-tune:
	make -C $@

sdl-widgets.o: sdl-widgets.h sw-pixmaps.h config.h
testsw.o: sdl-widgets.h icon.xpm
