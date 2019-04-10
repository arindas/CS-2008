#ifndef heap_h
#define heap_h

#include <collec.h>
#include <alloc.h>

#include <stddef.h>

#define HEAP_ID 1001

#define PARENT(i) ((i)/2)

#define LCHILD(i) (2*(i)+1)

#define RCHILD(i) (2*(i))

typedef int (* is_greater_fn) (void * cmp_ctx, void *, void *);

typedef struct { 
	size_t			size;
	
	void ** 		buf;
	size_t 			capacity;
	allocator_t 	allocator;

	compare_fn 		compare;
} heap_t;

int heapify_bup (heap_t, int i);

int heapify_tdn (heap_t, int i);

int heap_insert (heap_t, void * key);

void * heap_extract (heap_t);

int heap_change_key (heap_t h, 
		int index, void * key);

void heap_build (heap_t);

heap_t * get_heap (allocator_t, 
		size_t cap, compare_fn);

collection_t heap_get_collection (heap_t *);

#endif
