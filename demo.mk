#
# Makefile for networked associative memory system
#
CC = gcc
#add -DEBUG to CFLAGS to get lots of debugging!
CFLAGS = -g 
CFILES = client_demo.c server_demo.c util.c
OFILES = server_demo.o util.o
HFILES = demo.h defs.h symlist.h symbol.h
LIBES = 
#LIBES =

server_demo: $(OFILES)
	$(CC) -o server_demo $(CFLAGS) $(OFILES) $(LIBES)

server_demo.o: server_demo.c $(HFILES)
	$(CC) $(CFLAGS) -c server_demo.c

util.o: util.c $(HFILES)
	$(CC) $(CFLAGS) -c util.c

server_demo.c:
	touch server_demo.c

client_demo.c:
	touch client_demo.c

client_demo: $(HFILES) client_demo.c server_demo
	$(CC) $(CFLAGS) $(LIBES) client_demo.c -o client_demo

print:
	pr demo.mk $(HFILES) $(CFILES)

clean:
	rm -f *.o *~

