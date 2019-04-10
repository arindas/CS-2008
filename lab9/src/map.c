#include <map.h>

map_t * new_map (allocator_t alloc, compare_fn compare) {
	map_t * map 		= alloc.alloc (sizeof (map_t));
	
	int pair_cmp (void * a, void * b) {
		mapping_t * mA = a, * mB = b;
		return compare (mA->key, mB->key);	
	}

	collection_t set = set_get_collection (alloc, pair_cmp);

	*map = (map_t) { .mapping_set = set, 
		.compare = pair_cmp, alloc = alloc };

	return map;
}

static mapping_t * __get (map_t * map, void * key) {
	mapping_t __key = (mapping_t) { .key = key, .value = NULL }; 
	return map->mapping_set.search (map->mapping_set, &__key);
}

void * put (map_t * map, void * key, void * value) {
	mapping_t * mapping = __get (map, key);
	
	if (mapping != NULL) {
		mapping->value = value;
	} else {
		mapping = map->alloc.alloc (sizeof (mapping_t));
		mapping->key = key; mapping->value = value;
		map->mapping_set.add (map->mapping_set, mapping);
	}

	return mapping;
}

void * get (map_t * map, void * key) {
	mapping_t * mapping = __get (map, key);
	return mapping? mapping->value: NULL;
}
