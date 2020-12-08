#==========================================
#    Makefile: makefile for sl 5.1
#	Copyright 1993, 1998, 2014
#                 Toyoda Masashi
#		  (mtoyoda@acm.org)
#	Last Modified: 2014/03/31
#==========================================

CC=gcc

ifeq ($(OS),Windows_NT)
	CFLAGS=-O -Wall -I./PDCurses -L.
	RM = cmd /c del
	SL = sl.exe
	CURSES = -l:pdcurses.a
else
	CFLAGS=-O -Wall
	RM = rm -f
	SL = sl
	CURSES = -lncurses
endif

all: pdcurses.a $(SL)

$(SL): sl.c sl.h
	$(CC) $(CFLAGS) -o $(SL) sl.c $(CURSES)

pdcurses.a:
	$(MAKE) -C ./PDCurses/wincon
	cp ./PDCurses/wincon/pdcurses.a .

clean:
	$(RM) $(SL)
	$(MAKE) -C ./PDCurses/wincon clean
	$(RM) pdcurses.a

distclean: clean
