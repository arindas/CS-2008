#ifndef adj_list_h
#define adj_list_h

#include <graph.h>
#include <llist.h>

/* vertex anchor in adjacency list */
typedef struct { 
	/* vertex at this anchor */ 
	vertex_t 	vertex;				
	/* list of adj. anchors */
	llist_t 	adj_list; 	
} v_anchor_t;

/* an adjacency */
typedef struct {
	/* edge in this adjacency */
	edge_t 		edge;
	/* target anchor of this adjacency */
	v_anchor_t 	*v_anchor;	
} adj_t;

/* adjacency list */
typedef struct { 
	/* list of vertex anchors */
	llist_t v_anchors; 
	/* allocator */
	allocator_t alloc;
} adj_list_t;

adj_list_t new_adj_list (allocator_t alloc) {
	return (adj_list_t) { .alloc = alloc, 
		.v_anchors = new_llist(alloc) };
}

/* adj_list_add_vertex: adds a new vertex to this adj_list */
v_anchor_t * adj_list_add_vertex (adj_list_t *, vertex_t);

/* adj_list_add_edge: adds a new edge to this adj_list */
void adj_list_add_edge (adj_list_t *, vertex_t, edge_t);

/* get_anchor: returns the vertex anchor in the 
 * adj_list associated with this vertex */
v_anchor_t * get_anchor (adj_list_t*, vertex_t);

/* get_adjacent: returns the list of adjacencies associated with this vertex anchor */
llist_t get_adjacencies (v_anchor_t *v_anch) { return v_anch->adj_list; }

void * adj_list_graph_add_vertex (void *graph_ctx, vertex_t v) 
{ return (void *) adj_list_add_vertex ((adj_list_t *) graph_ctx, v); }

void adj_list_graph_add_edge (void *graph_ctx, vertex_t v, edge_t e) 
{ adj_list_add_edge ((adj_list_t *) graph_ctx, v, t); }

void adj_list_graph_get_repr (void *graph_ctx, vertex_t v) 
{ return (void *) get_anchor ((adj_list_t *) graph_ctx, v); }

vertex_t adj_list_graph_get_vertex (void *repr) 
{ return ((v_anchor_t) repr)->vertex; }

llist_t adj_graph_get_adjacencies (void *vertex_repr) 
{ return get_adjacent ((v_anchor_t *) vertex_repr); }

double adj_graph_get_adjacency_weight (void *adj) 
{ return ((adj_t) adj)->edge.weight; }
void * adj_graph_get_adjacency_dest_vertex_repr (void * adj) 
{ return ((adj_t) adj)->v_anchor; }

/* adj_list_graph: return an implementation 
 * of the graph interface using adj_list_t */
graph_t adj_list_graph (adj_list_t *adj_l) {
	return (graph_t) { 
		.add_vertex = adj_list_graph_add_vertex, 
		.add_edge = adj_list_graph_add_edge,
		
		.get_repr = adj_list_graph_get_repr,
		.get_vertex = adj_list_graph_get_vertex,
		.get_adjacencies = adj_list_graph_get_adjacencies,
		
		.get_adjacency_weight = adj_graph_get_adjacency_weight,
		.get_adjacent_vertex_repr = adj_graph_get_adjacency_dest_vertex_repr, 

		.graph_ctx = adj_l 
	};
}

#endif
