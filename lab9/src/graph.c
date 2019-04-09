#include <graph.h>
#include <collec.h>
#include <llist.h>
#include <alloc.h>

static int cmp_edges (void * A, void * B) {
	edge_t * eA = A, * eB = B;

	return eA->dest->id != eB->dest->id? 
		eA->dest->id - eB->dest->id: 
		eA->weight - eB->weight;
}

vertex_t * std_new_vertex (graph_t G, vertex_id vid) {
	
	
	llist_t * list = new_llist (G.allocator);
	collection_t edges = llist_get_collection (list, cmp_edges);
	
	vertex_t * v = G.allocator.alloc (sizeof (vertex_t));
	*v = (vertex_t) {.id = vid, .edges = edges}; 
	
	return v;
}

edge_t * std_new_edge (graph_t G, vertex_id dst, double weight) {
	vertex_t * dest = graph_add_vertex (G, dst); 
	
	edge_t * e = G.allocator.alloc (sizeof (vertex_t));
	*e = (edge_t) {.weight = weight, .dest = dest}; 
	
	return e;
}


vertex_t * get_vertex (graph_t G, vertex_id vid) {
	
	vertex_t v = (vertex_t) {.id = vid};
	return G.vertices.search (G.vertices, &v);
}


vertex_t * graph_add_vertex (graph_t G, vertex_id vid) { 
	vertex_t * V = get_vertex (G, vid);
	return V? V: G.vertices.add (
			G.vertices, G.new_vertex(G, vid)); 
}

edge_t * graph_add_edge (graph_t G, vertex_id src, 
		vertex_id dst, double weight) { 
	vertex_t * u = graph_add_vertex (G, src);
	edge_t * e = G.new_edge (G, dst, weight);
	return u->edges.add (u->edges, e);
}
