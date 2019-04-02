#ifndef llist_h
#define llist_h

#include <util.h>
#include <alloc.h>

#define NULL (void *)0

/* linked list node */
typedef struct _llnode {
	void 			*data;
	
	struct _llnode 	*prev;
	struct _llnode 	*next;
} llnode_t;

/* linked list header */
typedef struct {
	/* size of linked list */
	int 		size;
	
	/* anchors */
	llnode_t 	*head; 
	llnode_t 	*tail;

	/* allocator */
	allocator_t	alloc;
} llist_t;

llist_t new_llist (allocator_t alloc) {
	return (llist_t) {.size = 0, .head = NULL, 
		.tail = NULL, .alloc = alloc };
}

/* llnode_add_at_head: constructs a new node from the 
 * given data and adds it to the head of this list */
llnode_t * llnode_add_at_head (llist_t, void *);

/* llnode_add_at_head: constructs a new node from the 
 * given data and adds it to the tail of this list */
llnode_t * llnode_add_at_tail (llist_t, void *);

/* llnode_search: searches for the given data in the list and returns 
 * the node associated with it. If not found NULL is returned */
llnode_t * llnode_search (llist_t, void *, compare_fn);

/* llnode_delete: deletes all occurences of the provided data 
 * in the list. It returns the number of nodes deleted. */
int llnode_delete (llist_t, void *, compare_fn);

#endif
