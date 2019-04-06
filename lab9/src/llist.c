#include <llist.h>

llnode_t * llnode_add_at_head (llist_t *l, void *elem) {
	llnode_t * node = l->allocator.alloc (sizeof (llnode_t));
	
	if (!node || !elem) return NULL;

	*node = (llnode_t) {.prev = NULL, .next = l->head, .data = elem};
	llnode_t ** anchor = l->head? &l->head->prev: &l->tail;
	l->head = *anchor = node; return node;
}

llnode_t * llnode_add_at_tail (llist_t *l, void *elem) {
	llnode_t * node = l->allocator.alloc (sizeof (llnode_t));
	
	if(!node || !elem) return NULL;
	
	*node = (llnode_t) {.prev = l->tail, .next = NULL, .data = elem};
	llnode_t ** anchor = l->tail? &l->tail->next: &l->head;
	l->tail = *anchor = node; return node;
}

llnode_t * llnode_search (llist_t *l, void *elem, 
		int (*is_equal)(void *, void *)) {
	
	for (llnode_t *p = l->head; p; p = p->next) 
		if (is_equal(p->data, elem)) return p;

	return NULL;
}

static llnode_t **_llnode_delete (llnode_t ** anchor, 
		void (*free_fn) (void *)) {
	
	llnode_t * p = *anchor;

	if (p->next) p->next->prev = p->prev;
	if (p->prev) p->prev->next = p->next;

	*anchor = !p->next? p->prev: p->next; 

	p->prev = p->next = NULL; free_fn (p);

	return anchor;
}

int llnode_delete (llist_t *l, void *elem, 
		int (*is_equal) (void *, void *)) {
	
	int count = 0;
	
	for (llnode_t **p = &l->head; *p;) {
		
		if (is_equal(elem, (*p)->data)) {
			p = _llnode_delete (p, l->allocator.free);
			count++;
		} else 
			p = &(*p)->next;
	}

	return count;
}

void llnode_add_list (llist_t *list, llist_t *suffix) {
	if (!suffix->head || !list->tail) return;
	
	list->tail->next = suffix->head;
	suffix->head->prev = list->tail;

	list->tail = suffix->tail;
}

void llnode_for_each (llist_t * l, void (* action) (void *)) {
	for (llnode_t *p = l->head; p; p = p->next) 
		action (p->data);
}

static void * search (collection_t this, void *element, 
		int (*is_equal) (void *, void *)) {

	llist_t * l = this.collection_ctx;
	return llnode_search (l, element, is_equal);
}

static int remove (collection_t this, void * element, 
		int (*is_equal) (void *, void *)) {
	
	llist_t * l = this.collection_ctx;
	return llnode_delete (l, element, is_equal);
}

static void * add (collection_t this, void * element) {
	
	llist_t * l = this.collection_ctx;
	return llnode_add_at_tail (l, element);
}

static void for_each (collection_t this, void (* action) (void *)) {
	
	llist_t * l = this.collection_ctx;
	llnode_for_each (l, action);
}

static void add_all (collection_t this, collection_t that) {
	
	llist_t * l = this.collection_ctx;

	if (that.collection_id == LIST_ID) {
		llist_t * m = that.collection_ctx;
		llnode_add_list (l, m);
	} else std_add_all (this, that);
}

collection_t get_collection (llist_t *list) {
	return (collection_t) {
		.search 		= search,
		.remove 		= remove,
		.add 			= add,
		.for_each 		= for_each,
		.add_all 		= add_all,
		.collection_id  = LIST_ID,
		.collection_ctx = list 
	};
}


