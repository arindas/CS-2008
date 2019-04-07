#ifndef trav_h
#define trav_h 

#include <graph.h>

void DFS (vertex_t, void (*action) (vertex_t));

void BFS (vertex_t, void (*action) (vertex_t));

#endif
