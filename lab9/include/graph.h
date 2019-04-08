#ifndef graph_h
#define graph_h

#include <collec.h>
#include <llist.h>
#include <alloc.h>

typedef unsigned int vertex_id;

typedef struct {
	vertex_id 		id;
	collection_t 	edges;
} vertex_t;

typedef struct {
	double 		weight;
	vertex_t * 	dest;
} edge_t;

typedef struct _graph {
	allocator_t		allocator;

	vertex_t * 		(* new_vertex) (
			struct _graph, vertex_id);
	
	edge_t * 		(* new_edge) (
			struct _graph, vertex_id dst, 
			double weight );
	
	collection_t 	vertices;
} graph_t;

vertex_t * std_new_vertex (graph_t, vertex_id);
edge_t * std_new_edge (graph_t, vertex_id, double);

vertex_t * get_vertex (graph_t, vertex_id);
vertex_t * graph_add_vertex (graph_t, vertex_id);

edge_t * graph_add_edge (graph_t, vertex_id, 
		vertex_id, double);

#endif
