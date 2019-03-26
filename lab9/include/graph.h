#ifndef graph_h
#define graph_h

typedef vertex_t unsigned int;

typedef struct { 
	vertex_t src, dst;
	double e_weight;	
} edge_t;

typedef void (* neigbouring_edges) (vertex_t, edge_t *edge_buffer);

#endif

