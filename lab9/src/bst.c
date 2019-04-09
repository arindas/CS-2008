#include <collec.h>
#include <alloc.h>
#include <bst.h>

bst_t * new_bst (allocator_t a, compare_fn compare) {
	bst_t * bst = a.alloc (sizeof (bst_t));
	if (!bst) return NULL;

	*bst = (bst_t) {.root = NULL, .size = 0, 
		.allc = a, .compare = compare };

	return bst;
}

typedef struct { bst_node_t *q, ** p; } loc_t;

static loc_t __bst_search (bst_node_t ** root, 
		compare_fn compare, void * key) {
	
	bst_node_t ** p = root, *q = NULL;

	while (*p && compare ((*p)->data, key) != 0) { q = *p;
		p = compare ((*p)->data, key) > 0? &(*p)->rchild: &(*p)->lchild; }

	return (loc_t) {.q = q, .p = p};
}

bst_node_t * bst_insert (bst_t * bst, void * data) {
	bst_node_t * node = bst->allc.alloc (sizeof (bst_node_t));
	
	if (node) { 
		*node = (bst_node_t) { .data = data,
			.lchild = NULL, .rchild = NULL }; 
	}

	loc_t loc = __bst_search (&bst->root, bst->compare, data);

	// restrict duplicate entries
	if (!node || *loc.p) 
		return NULL;

	bst->size++; *loc.p = node; return node;
}

bst_node_t * bst_search (bst_t * bst, void * data) 
{ return *((loc_t)__bst_search (&bst->root, bst->compare, data)).p; }

void * bst_remove (bst_t * bst, void * data) {
	loc_t loc = __bst_search (&bst->root, bst->compare, data);
	
	// element not found
	if (!*loc.p) return NULL;

	bst_node_t * to_be_freed = *loc.p, ** p = loc.p, 
			   ** in_order_succ, * in_suc;

	if (!(*p)->lchild) 
		*p = (*p)->rchild;
	
	else if (!(*p)->rchild)
		*p = (*p)->lchild;
	
	else {
		
		// find inorder successor
		in_order_succ = &(*p)->rchild;
		while ((*in_order_succ)->lchild)
			in_order_succ = &(*in_order_succ)->lchild;

		in_suc = * in_order_succ;

		// isolate inorder succesor
		if (in_suc != (*p)->rchild) {
			*in_order_succ = in_suc->rchild;
			
			// assign right subtree of node to be deleted 
			// to the right of the inorder successor
			in_suc->rchild = (*p)->rchild;
		}

		// replace node to be deleted with inorder successor 
		in_suc->lchild = (*p)->lchild; *p = in_suc;
	}

	bst->allc.free (to_be_freed); 	
	bst->size--; return data;
}

static void intrav (bst_node_t * p, 
		void (* action) (void *)) {
	
	if (!p) return;

	intrav (p->lchild, action);
	action (p->data);
	intrav (p->rchild, action);
}

void bst_intrav (bst_t * bst, 
		void (* action) (void *)) 
{ intrav (bst->root, action); }

static void * search (collection_t this, void * element) {
	bst_t * bst = this.collection_ctx;
	return ((bst_node_t *) bst_search (bst, element))->data;
}

static int remove (collection_t this, void * element) {
	bst_t * bst = this.collection_ctx;
	return bst_remove (bst, element) != NULL;	
}

static void * add (collection_t this, void * element) {
	bst_t * bst = this.collection_ctx;
	return ((bst_node_t *) bst_insert (bst, element))->data;
}

static void * pop (collection_t this) {
	bst_t * bst = this.collection_ctx;
	return bst->root? 
		bst_remove (bst, bst->root->data): NULL;
}

static void for_each (collection_t this, 
		void (* action) (void *)) {
	
	bst_t * bst = this.collection_ctx;
	bst_intrav (bst, action);
}

static int size (collection_t this) {
	bst_t * bst = this.collection_ctx;
	return bst->size;
}

collection_t bst_get_collection (bst_t * bst) {
	
	return (collection_t) {
		.search 		= search,
		.remove 		= remove,
		.add 			= add,
		.pop			= pop,
		.for_each 		= for_each,
		.add_all 		= std_add_all,
		.size 			= size,
		.compare 		= bst->compare,
		.collection_id  = BST_ID,
		.collection_ctx = bst 
	};
}
