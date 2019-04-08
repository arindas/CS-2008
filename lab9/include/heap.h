#ifndef heap_h
#define heap_h

#include <stdlib.h>

#define PARENT(i) ((i)/2)

#define LCHILD(i) (2*(i)+1)

#define RCHILD(i) (2*(i))

typedef struct { 
	int 	size;
	
	int 	(* is_greater) (
			void *, void *);

	void ** 	buf;
	int 		capacity;
	allocator_t allocator;
} heap_t;

int heapify_bup (heap_t, int i);

int heapify_tdn (heap_t, int i);

int insert (heap_t, void * key);

void * extract (heap_t);

void * extract_at (heap_t, int index);

void * search (heap_t, void *);

void build_heap (heap_t);

void swap (void ** buf, int i, int j) 
{ void * t = buf[i]; buf[i] = buf[j]; buf[j] = t;}

collection_t heap_get_collection (heap_t *);

#endif
