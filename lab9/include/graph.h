#ifndef graph_h
#define graph_h

#include <llist.h>

/* vertex label */
typedef vertex_t unsigned int;

typedef struct { 
	/* destination vertex of this edge */
	vertex_t 	dest;
	
	/* weight of this edge */
	double 		weight;	

} edge_t;

/* graph_add_vertex_fn: fn to add a vertex. It returns the mapped 
 * representation of the new vertex in the given graph context  */
void * (*graph_add_vertex_fn) (void *graph_ctx, vertex_t);

/* graph_add_edge_fn: fn to add an edge */
void (*graph_add_edge_fn) (void *graph_ctx, vertex_t, edge_t);

/* graph_get_vertex_repr_fn: fn to return the mapped representation
 * of the vertex in the given graph context */
void * (*graph_get_vertex_repr_fn) (void *graph_ctx, vertex_t);

/* graph_get_adjacency_fn: fn to return the adjacency of this vertex_repr */
llist (*graph_get_adjacencies_fn) (void *graph_ctx, void *vertex_repr);

/* graph_get_adjacency_weight_fn: fn to return 
 * the weight associated with this adjacency */
double (*graph_get_adjacency_weight_fn) (void *adj);

/* graph_get_dest_vertex_repr_fn: fn to return the mapped repr 
 * of the dest vertex assocatied with this adjacency */
void * (*graph_get_dest_vertex_repr_fn) (void *adj);

/* the graph interface */
typedef struct {
	/* insert */
	graph_add_vertex_fn 			add_vertex;
	graph_add_edge_fn 				add_edge;
	
	/* query */
	graph_get_vertex_repr_fn 		get_repr;
	graph_get_adjacencies_fn 		get_adjacencies;
	
	graph_get_adjacency_weight_fn 	get_adjacency_weight;
	graph_get_dest_vertex_repr_fn 	get_adjacent_vertex_repr;
	
	/* graph context */
	void 						*graph_ctx;

} graph_t;

#endif

