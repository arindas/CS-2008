#ifndef pq_h
#define pq_h

#include "heap.h"

typedef heap_t priority_q_t;

int * extract_head (priority_q_t *q);

int peek_head (priority_q_t *q);

int replace_key (priority_q_t *q, int i, int key); 

int insert (priority_q_t *q, int key);

#endif
