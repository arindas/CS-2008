#ifndef graph_h
#define graph_h

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
}

#endif
