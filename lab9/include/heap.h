#ifndef heap_h
#define heap_h

#include <collec.h>
#include <alloc.h>

#include <stdlib.h>

#define PARENT(i) ((i)/2)

#define LCHILD(i) (2*(i)+1)

#define RCHILD(i) (2*(i))

typedef struct { 
	int 	size;
	
	void * 	compare_ctx;
	int 	(* is_greater) ( 
			void * cmp_ctx, 
			void * A, void * B);

	void ** 	buf;
	int 		capacity;
	allocator_t allocator;
} heap_t;

int heapify_bup (heap_t, int i);

int heapify_tdn (heap_t, int i);

int heap_insert (heap_t, void * key);

void * heap_extract (heap_t);

// TODO: 
void * heap_extract_at (heap_t, int index);

// TODO:
int heap_search (heap_t, void *, 
		int (*is_equal) (void *, void *));

void heap_build (heap_t);

collection_t heap_get_collection (heap_t *);

#endif
