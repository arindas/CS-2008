INCLUDE_DIR := ../include 
LIB_DIR := ../lib 


CC := gcc 
CFLAGS := -g -O3 -Wall
AR := ar 
ARFLAGS := rsD 

RM := rm -f 

build:
	$(CC) -I $(INCLUDE_DIR) -c heap.c $(CFLAGS)
	$(AR) $(ARFLAGS) libheap.a heap.o
	mv libheap.a $(LIB_DIR)

clean:
	$(RM) *.a *.o
