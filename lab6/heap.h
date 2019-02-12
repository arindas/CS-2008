#ifndef heap_h
#define heap_h

#include <stdlib.h>

#define PARENT(i) ((i)/2)

#define LEFT(i) (2*(i)+1)

#define RIGHT(i) (2*(i))

typedef int (*compareFn) (int, int);

typedef struct { 
	int *arr, size, capacity; 
	compareFn compare;
} heap_t;

heap_t *new_heap(size_t cap, compareFn c);

void free_heap(heap_t *h);

int heapifyUp (heap_t *h, int i);

int heapifyDown (heap_t *h, int i);

int insert (heap_t *h, int key);

int * extract (heap_t *h);

heap_t * buildHeap (int *arr, int size, compareFn c);
#endif
