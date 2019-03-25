INCLUDE_DIR := ../include 
LIB_DIR := ../lib 

CC := gcc
CFLAGS := -g -O3 -Wall 

RM := rm -f

P = huff_code

build: 
	$(CC) -I $(INCLUDE_DIR) -L $(LIB_DIR) -c $(P).c $(CFLAGS)
	
disassemble:
	objdump -S $(P).o > $(P).S

clean:
	$(RM) *.o *.S
