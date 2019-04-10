#ifndef trav_h
#define trav_h 

#include <graph.h>
#include <map.h>

typedef int (* action_fn) (vertex_t *);
typedef map_t * (* traversal_fn) 	(graph_t, vertex_t *, action_fn);

map_t * depth_first_traversal 		(graph_t, vertex_t *, action_fn);
map_t * breadth_first_traversal 	(graph_t, vertex_t *, action_fn);

llist_t * find_path (graph_t G, traversal_fn trav, 
		vertex_id src, vertex_id dst); 

llist_t * bfs_shortest_path (graph_t G, vertex_id src, vertex_id dst) 
{ return find_path (G, breadth_first_traversal, src, dst); }

#endif
