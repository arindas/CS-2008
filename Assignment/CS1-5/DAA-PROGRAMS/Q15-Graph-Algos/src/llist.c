#include <llist.h>

llnode_t * llnode_add_at_head (llist_t *l, void *elem) {
	llnode_t * node = l->allocator.alloc (sizeof (llnode_t));
	
	if (!node || !elem) return NULL;

	*node = (llnode_t) {.prev = NULL, .next = l->head, .data = elem};
	llnode_t ** anchor = l->head? &l->head->prev: &l->tail;
	l->head = *anchor = node; l->size++; return node;
}

llnode_t * llnode_search (llist_t *l, void *elem, 
		int (*cmp)(void *, void *)) {
	
	for (llnode_t *p = l->head; p; p = p->next) 
		if (cmp(p->data, elem) == 0) return p;

	return NULL;
}

llnode_t * llnode_add_at_tail (llist_t *l, void *elem) {
	llnode_t * node = l->allocator.alloc (sizeof (llnode_t));
	
	if(!node || !elem) return NULL;
	
	*node = (llnode_t) {.prev = l->tail, .next = NULL, .data = elem};
	llnode_t ** anchor = l->tail? &l->tail->next: &l->head;
	l->tail = *anchor = node; l->size++; return node;
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
		int (*cmp) (void *, void *)) {
	
	int count = 0;
	
	for (llnode_t **p = &l->head; *p;) {
		
		if (cmp(elem, (*p)->data) == 0) {
			p = _llnode_delete (p, l->allocator.free);
			count++;
		} else 
			p = &(*p)->next;
	}

	l->size -= count; return count;
}

void llnode_add_list (llist_t *list, llist_t *suffix) {
	if (!suffix->head || !list->tail) return;
	
	list->tail->next = suffix->head;
	suffix->head->prev = list->tail;

	list->tail = suffix->tail; 
	list->size += suffix->size;
}

void llnode_for_each (llist_t * l, void (* action) (void *)) {
	for (llnode_t *p = l->head; p; p = p->next) 
		action (p->data);
}

static void * search (collection_t this, void *element) {

	llist_t * l = this.collection_ctx;
	llnode_t * node = llnode_search (l, element, this.compare);
	return node? node->data: NULL;
}

static int remove (collection_t this, void * element) {
	
	llist_t * l = this.collection_ctx;
	return llnode_delete (l, element, this.compare);
}

static void * add (collection_t this, void * element) {
	
	llist_t * l = this.collection_ctx;
	return (llnode_t *) (llnode_add_at_tail (
				l, element))->data;
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

static int size (collection_t this) 
{ return ((llist_t *) this.collection_ctx)->size; }

static void * pop (collection_t this) {
	llist_t * l = this.collection_ctx;
	return llist_pop_head (l);
} 

collection_t llist_get_collection (
		llist_t *list, compare_fn compare) {
	
	return (collection_t) {
		.search 		= search,
		.remove 		= remove,
		.add 			= add,
		.pop			= pop,
		.for_each 		= for_each,
		.add_all 		= add_all,
		.size 			= size,
		.compare 		= compare,
		.collection_id  = LIST_ID,
		.collection_ctx = list 
	};
}


