#ifndef alloc_h
#define alloc_h

#include <stddef.h>

typedef void * ( *alloc_fn ) (size_t size);
void * std_alloc_fn (size_t size);

typedef void ( *free_fn ) (void *);
void std_free_fn (void *);

typedef struct {
	free_fn 	free;
	alloc_fn 	alloc;
} allocator_t;

allocator_t get_std_allocator () {
	return (allocator_t) {
		.free = std_free_fn, 
		.alloc = std_alloc_fn
	};
}

#endif
