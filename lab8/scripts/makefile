INCLUDE_DIR := ../include 
LIB_DIR := ../lib 

CC := gcc
CFLAGS := -g -O3 -Wall 

RM := rm -f

P = 

build:
	$(CC) -I $(INCLUDE_DIR) -L $(LIB_DIR) -c $(P) $(CFLAGS)

clean:
	$(RM) *.o 
