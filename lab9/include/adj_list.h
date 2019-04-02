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

} adj_list_t;

/* adj_list_add_vertex: adds a new vertex to this adj_list */
v_anchor_t * adj_list_add_vertex (adj_list_t *, vertex_t);

/* adj_list_add_edge: adds a new edge to this adj_list */
void adj_list_add_edge (adj_list_t *, vertex_t, edge_t);

/* get_anchor: returns the vertex anchor in the 
 * adj_list associated with this vertex */
v_anchor_t * get_anchor (adj_list_t*, vertex_t);

/* get_adjacent: returns the list of adjacencies 
 * associated with this vertex anchor */
llist_t get_adjacent (v_anchor_t *);

void * adj_list_graph_add_vertex (void *graph_ctx, vertex_t v) 
{ return (void *) adj_list_add_vertex ((adj_list_t *) graph_ctx, v); }

void adj_list_graph_add_edge (void *graph_ctx, vertex_t v, edge_t e) 
{ adj_list_add_edge ((adj_list_t *) graph_ctx, v, t); }

void adj_list_graph_get_repr (void *graph_ctx, vertex_t v) 
{ return (void *) get_anchor ((adj_list_t *) graph_ctx, v); }

llist_t adj_graph_get_adjacency (void *vertex_repr) 
{ return get_adjacent ((v_anchor_t *) vertex_repr); }

/* adj_list_graph: return an implementation 
 * of the graph interface using adj_list_t */
graph_t adj_list_graph (adj_list_t *adj_l) {
	return (graph_t) { 
		.add_vertex = adj_list_graph_add_vertex, 
		.add_edge = adj_list_graph_add_edge,
		
		.get_repr = adj_list_graph_get_repr,
		.get_adjacency = adj_list_graph_get_adjacency
		
		.graph_ctx = adj_l 
	};
}

#endif
