#include <llist.h>
#include <trav.h>
#include <graph.h>

// TODO: Handle cycles

void DFS (vertex_t V, void (* action) (vertex_t)) {
	llist_t * list = new_llist (get_std_allocator ());
	llnode_add_at_head (list, &V);

	while (list->size != 0) {
		vertex_t * u = llist_pop_head (list);
		
		action (*u); // visit u

		void add_neighbour (void * e) 
		{ llnode_add_at_head (list, ((edge_t *)e)->dest); }

		u->edges.for_each (u->edges, add_neighbour);
	}
}

void BFS (vertex_t V, void (* action) (vertex_t)) {
	llist_t * list = new_llist (get_std_allocator ());
	llnode_add_at_tail (list, &V);

	while (list->size != 0) {
		vertex_t * u = llist_pop_head (list);

		action (*u); // visit u

		void add_neighbour (void * e)
		{ llnode_add_at_tail (list, ((edge_t *)e)->dest); }

		u->edges.for_each (u->edges, add_neighbour);
	}
}
