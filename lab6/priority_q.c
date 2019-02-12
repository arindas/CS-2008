#include "priority_q.h"

// typedef priority_q_t heap_t;

int * extract_head (priority_q_t *q) {
	return extract(q);
}

int peek_head (priority_q_t *q) {
	return q->arr[0];
}

int replace_key (priority_q_t *q, int i, int key) {
	if (i < 0 || i >= q->size) {
		return -1;		
	}

	int old_key = q->arr[i];
	q->arr[i] = key;

	return q->compare(key, old_key) > 0?
		heapifyUp(q, i): heapifyDown(q, i); 
}

int insert (priority_q_t *q, int key) 
{ return insert(q, key); } 
