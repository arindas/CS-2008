#ifndef map_h
#define map_h 

#include <collec.h>
#include <set.h>

typedef struct { void * key, * value; } mapping_t;

typedef struct {
	collection_t 	mapping_set;
	compare_fn * 	compare;

	allocator_t 	alloc;
} map_t;

map_t * new_map (allocator_t alloc, compare_fn compare);

void * put (map_t * map, void * key, void * value);
void * get (map_t * map, void * key);

#endif
