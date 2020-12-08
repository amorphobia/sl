#==========================================
#    Makefile: makefile for sl 5.1
#	Copyright 1993, 1998, 2014
#                 Toyoda Masashi
#		  (mtoyoda@acm.org)
#	Last Modified: 2020/12/08
#==========================================

CC=gcc

ifeq ($(OS),Windows_NT)
	LIBDIR=PDCurses/wincon
	CFLAGS=-O -Wall -IPDCurses -L$(LIBDIR)
	RM=cmd /c del
	SL=sl.exe
	CURSES=-l:pdcurses.a
	LIBCURSES=$(LIBDIR)/pdcurses.a
else
	CFLAGS=-O -Wall
	RM=rm -f
	SL=sl
	CURSES=-lncurses
endif

all: $(LIBCURSES) $(SL)

$(SL): sl.c sl.h
	$(CC) $(CFLAGS) -o $(SL) sl.c $(CURSES)

$(LIBCURSES):
	$(MAKE) -C $(LIBDIR)

clean:
	$(RM) $(SL)
ifeq ($(OS),Windows_NT)
	$(MAKE) -C $(LIBDIR) clean
endif

distclean: clean
