#include <float.h>

#include <graph.h>

#include <heap.h>
#include <map.h>

#include <prim.h>

map_t * mst_prim (graph_t G, vertex_id src) {

	vertex_t * r = get_vertex (G, src);

	map_t * cost = new_map (G.allocator, vertex_compare);
	map_t * prev = new_map (G.allocator, vertex_compare);

	void map_vertex (void * p) { 
		double * c = G.allocator.alloc (sizeof (double)); 
		vertex_t * v = p; *c = DBL_MAX;     
		put (cost, v, c); put (prev, v, NULL);
	}

	G.vertices.for_each (G.vertices, map_vertex);

	int vertex_cmp (void * a, void * b) { 
		double *wA = get (cost, a), *wB = get (cost, b); 
		return *wA > *wB? 1: *wA < *wB? -1: 0; 
	}

	heap_t * vertex_heap = new_heap (G.allocator, 
			G.vertices.size(G.vertices), vertex_cmp);
	
	void add_vertex (void * v) 
	{ heap_insert (*vertex_heap, v); }

	G.vertices.for_each (G.vertices, add_vertex);

	put (cost, r, 0);
	heap_build (*vertex_heap);

	collection_t visited = set_get_collection (
			get_std_allocator(), vertex_compare); 

	while (vertex_heap->size != 0) {
		vertex_t * u = heap_extract (*vertex_heap); 

		void edge_op (void * p) { edge_t * e = p;
			if (!visited.search (visited, e->dest) 
					&& e->weight < *((double *)get (cost, e->dest))) 
			{ 
				put (cost, e->dest, &e->weight);
				put (prev, e->dest, u);
				heap_build (*vertex_heap);
			}
		}

		u->edges.for_each (u->edges, edge_op);
	}

	return prev;
}
