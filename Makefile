
exec_prefix = ${prefix}
prefix = /usr/local

includedir = $(DESTDIR)${prefix}/include
libdir = $(DESTDIR)${exec_prefix}/lib
datadir = $(DESTDIR)${prefix}/share

AR = ar
CC = gcc
CFLAGS = -g -O2 -fPIC
LDFLAGS = 
SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)

SO_NAME := libjson.so.1.0
REAL_NAME = libjson.so.1.1.0

all: libjson.a libjson.so

libjson.a: $(OBJS)
	$(AR) rcs $@ $^

libjson.so: $(OBJS)
	$(CC) -shared -Wl,-soname,$(SO_NAME) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $^

clean:
	rm -f libjson.so libjson.a $(OBJS)

.PHONY: all clean

