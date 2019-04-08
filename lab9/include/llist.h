#ifndef llist_h
#define llist_h

#include <alloc.h>
#include <collec.h>

#define LIST_ID 1000

struct _llist;

/* linked list node */
typedef struct _llnode {
	void 			*data;
	
	struct _llnode 	*prev;
	struct _llnode 	*next;
} llnode_t;

/* linked list header */
typedef struct _llist {
	/* size of linked list */
	int 		size;
	
	/* anchors */
	llnode_t 	*head; 
	llnode_t 	*tail;

	/* allocator */
	allocator_t	allocator;
} llist_t;

llist_t * new_llist (allocator_t alloc) {
	llist_t * l = alloc.alloc (sizeof (llist_t));
	
	*l = (llist_t) {.size = 0, .head = NULL, 
		.tail = NULL, .allocator = alloc };

	return l;
}

/* llnode_add_at_head: constructs a new node from the 
 * given data and adds it to the head of this list */
llnode_t * llnode_add_at_head (llist_t *, void *);

/* llnode_add_at_head: constructs a new node from the 
 * given data and adds it to the tail of this list */
llnode_t * llnode_add_at_tail (llist_t *, void *);

/* llnode_pop_head: pops the head of this list */
llnode_t * llnode_pop_head (llist_t *l) 
{ llnode_t *p = l->head; l->head = p->next; return p; }

void * llist_pop_head (llist_t *l) { 
	llnode_t *p = llnode_pop_head (l);
	void * data = p->data; 
	l->allocator.free (p); return data;
}

/* llnode_pop_tail: pops the tail of this list */
llnode_t * llnode_pop_tail (llist_t *l)
{ llnode_t *p = l->tail; l->tail = p->prev; return p; }

void * llist_pop_tail (llist_t *l) {
	llnode_t *p = llnode_pop_tail (l);
	void * data = p->data;
	l->allocator.free (p); return data;
}

/* llnode_search: searches for the given data in the list and returns 
 * the node associated with it. If not found NULL is returned */
llnode_t * llnode_search (llist_t *, void *, 
		int (*is_equal) (void *, void *));

/* llnode_delete: deletes all occurences of the provided data 
 * in the list. It returns the number of nodes deleted. */
int llnode_delete (llist_t *, void *, int (*is_equal) (void *, void *));

/* llnode_add_list: adds a new suffix 
 * list at the tail of this list */
void llnode_add_list (llist_t *list, llist_t *suffix);

void llnode_for_each (llist_t *, void (*) (void *));

collection_t llist_get_collection (llist_t *list);

#endif
