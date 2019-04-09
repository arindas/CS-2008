#ifndef set_h
#define set_h 

#include <collec.h>
#include <bst.h>

collection_t set_get_collection (
		allocator_t alloc, compare_fn compare) {
	bst_t * bst = new_bst (alloc, compare);
	return bst_get_collection(bst);
}

#endif
