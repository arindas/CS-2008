#include <adj_list.h>
#include <list.h>

v_anchor_t * get_anchor (adj_list_t * adj, vertex_t v) {
	int cmp (void *A, void *B) { v_anchor_t * anchor = A; 
		vertex_t * v = B; return anchor->vertex == v? 0: -1; }
	
	llnode_t * ptr = llnode_search (adj->v_anchors, &v, cmp);

	return ptr? (v_anchor_t *) ptr->data: NULL;
}

v_anchor_t * adj_list_add_vertex (adj_list_t *adj, vertex_t v) {
	
	// search for the vertex first
	v_anchor_t * v_anchor = get_anchor (adj, v);

	if (!v_anchor) {
		v_anchor = malloc (sizeof (v_anchor_t));

		*v_anchor = (v_anchor_t) {.vertex = v, 
			.adj_list = new_llist(adj->alloc) };

		llnode_add_at_tail (adj->v_anchors, v_anchor);
	}
	
	return v_anchor;
}

void adj_list_add_edge (adj_list_t *adj, vertex_t v, edge_t e) {
	v_anchor_t *src = get_anchor (adj, v);
	if (!src) src = adj_list_add_vertex (adj, v);

	v_anchor_t *dst = get_anchor (adj, e.dest);
	if (!dst) dst = adj_list_add_vertex (adj, e.dest);

	adj_t *adjacency = malloc (sizeof (adj_t));
	
	*adjacency = (adj_t) { .edge = e, .v_anchor = dst };

	llnode_add_at_tail (src->adj_list, adjacency);
}

llist_t get_adjacent (v_anchor_t * anch) { return anch->adj_list; }
