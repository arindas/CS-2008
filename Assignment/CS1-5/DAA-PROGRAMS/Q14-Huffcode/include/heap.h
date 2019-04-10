#ifndef heap_h
#define heap_h

#include <stdlib.h>

#define PARENT(i) ((i)/2)

#define LCHILD(i) (2*(i)+1)

#define RCHILD(i) (2*(i))

typedef int (*compare_greater_than_fn) (void * ctx, int, int);

typedef struct { 
	int 	size;
	int capacity; 
	
	void *compare_fn_ctx;
	compare_greater_than_fn compare;
} heap_ctx_t;

int heapify_bup (heap_ctx_t, int *buf, int i);

int heapify_tdn (heap_ctx_t, int *buf, int i);

int insert (heap_ctx_t, int *buf, int key);

int * extract (heap_ctx_t, int *buf);

void build_heap (int *buf, heap_ctx_t);

void swap (int *buf, int i, int j) 
{ int t = buf[i]; buf[i] = buf[j]; buf[j] = t;}

void heap_sort (int *buf, heap_ctx_t);

#endif
