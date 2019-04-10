#include <map.h>

map_t * new_map (allocator_t alloc, compare_fn compare) {
	map_t * map 		= alloc.alloc (sizeof (map_t));
	
	int pair_compare_fn (void * a, void * b) {
		mapping_t * mA = a, * mB = b;
		return compare (mA->key, mB->key);	
	}

	compare_fn * pair_cmp = alloc.alloc (sizeof (compare_fn));
	* pair_cmp = pair_compare_fn;

	if (!map || !pair_cmp) return NULL;

	collection_t set 	= set_get_collection (alloc, * pair_cmp);

	*map = (map_t) { .mapping_set = set, 
		.compare = pair_cmp, alloc = alloc };

	return map;
}

void * put (map_t * map, void * key, void * value) {
	mapping_t * mapping = map->alloc.alloc (sizeof (mapping_t));
	return map->mapping_set.add (map->mapping_set, mapping);
}

void * get (map_t * map, void * key) {
	mapping_t __key = (mapping_t) { .key = key, .value = NULL }; 
	
	mapping_t * mapping = map->mapping_set
		.search (map->mapping_set, &__key);
	return mapping? mapping->value: NULL;
}
