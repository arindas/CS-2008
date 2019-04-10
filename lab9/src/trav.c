#include <llist.h>
#include <map.h>
#include <collec.h>

#include <graph.h>

#include <trav.h>

map_t * depth_first_traversal (graph_t G, vertex_t * V, action_fn action) {
	llist_t * list = new_llist (get_std_allocator ());
	llnode_add_at_head (list, V);

	collection_t visited = set_get_collection (
			get_std_allocator(), vertex_compare);

	map_t * prev_map =  new_map ( 
			get_std_allocator(), vertex_compare);
	
	while (list->size != 0) {
		vertex_t * u = llist_pop_head (list);
		visited.add (visited, u);

		// visit u and break if something went wrong
		if(!action (u)) break; 

		void add_neighbour (void * e) { 
			vertex_t * v = ((edge_t *)e)->dest;
			if (visited.search(visited, v)) return;

			put (prev_map, v, u);
			llnode_add_at_head (list, ((edge_t *)e)->dest); 
		}

		u->edges.for_each (u->edges, add_neighbour);
	}

	return prev_map;
}

map_t * breadth_first_traversal (graph_t G, vertex_t * V, action_fn action) {
	llist_t * list = new_llist (get_std_allocator ());
	llnode_add_at_tail (list, V);
	
	collection_t visited = set_get_collection (
			get_std_allocator(), vertex_compare);

	map_t * prev_map =  new_map ( 
			get_std_allocator(), vertex_compare);
	
	while (list->size != 0) {
		vertex_t * u = llist_pop_head (list);
		visited.add (visited, u);

		// visit u and break if something went wrong
		if(!action (u)) break; 
		
		void add_neighbour (void * e) { 
			vertex_t * v = ((edge_t *)e)->dest;
			if (visited.search(visited, v)) return;

			put (prev_map, v, u);
			llnode_add_at_tail (list, ((edge_t *)e)->dest); 
		}

		u->edges.for_each (u->edges, add_neighbour);
	}

	return prev_map;
}

llist_t * find_path (graph_t G, traversal_fn trav, 
		vertex_id src, vertex_id dst) {
	
	vertex_t * src_v = get_vertex (G, src);
	vertex_t * dst_v = get_vertex (G, dst);

	int found = 0;

	int __action (vertex_t * v) { 
		found = vertex_compare (dst_v, v) == 0;
		return !found;
	}

	map_t * prev_map = trav (G, src_v, __action);
	
	if (!found) return NULL;
	
	llist_t * path = new_llist (get_std_allocator ());

	while (dst_v) {
		llnode_add_at_head (path, dst_v);
		dst_v = get (prev_map, dst_v);
	}

	return path;
}
