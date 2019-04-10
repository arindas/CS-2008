#ifndef bstree_h
#define bstree_h

#define BST_ID 1003

#include <collec.h>
#include <alloc.h>

typedef struct _bst_node {
	void * 				data;
	
	struct _bst_node * 	lchild;
	struct _bst_node * 	rchild;
} bst_node_t;

typedef struct {
	int 			size;
	bst_node_t * 	root;

	allocator_t		allc;
	compare_fn		compare;
} bst_t;

bst_t * new_bst (allocator_t, compare_fn);

bst_node_t * bst_insert (bst_t *, void *);
bst_node_t * bst_search (bst_t *, void *);

void * bst_remove (bst_t *, void * key);

void bst_intrav (bst_t * root, void (* action) (void *));

collection_t bst_get_collection (bst_t * t);

#endif
