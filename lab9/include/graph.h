#ifndef graph_h
#define graph_h

#include <collection.h>

typedef unsigned int vertex_id;

typedef struct {
	vertex_id 		id;
	collection_t 	edges;
} vertex_t;

typedef struct {
	double 		weight;
	vertex_t 	dest;
} edge_t;

typedef struct {
	collection_t vertices;
} graph_t;

void graph_add_vertex (graph_t G, vertex_t * V) 
{ G.vertices.add (G.vertices, V); }

void graph_add_edge (graph_t G, 
		vertex_t * V, edge_t * E) { 
	
	G.vertices.add (G.vertices, V);
	V->edges.add (V->edges, E); 
}

#endif
