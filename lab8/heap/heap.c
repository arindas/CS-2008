#include <heap.h>

#include <stdlib.h>
#include <errno.h>

#define cmp(i, j, h, buf) h.compare ( \
			h.compare_fn_ctx, buf[i], buf[j]) 

#define out_of_bounds(i, size) (i >= size || i < 0)

int heapify_bup (heap_ctx_t h, int *buf, int i) {
	if (out_of_bounds(i, h.size)) return -1;

	while (i > 0 && cmp(i, PARENT(i), h, buf) > 0) 
	{ swap(buf, i, PARENT(i)); i = PARENT(i); }

	return i;
}

int heapify_tdn (heap_ctx_t h, int *buf, int i) {
	if (out_of_bounds(i, h.size)) return -1;

	while(i < h.size) {
		int child = i;

		if (LCHILD(i) < h.size && cmp(LCHILD(i), child, h, buf) > 0) 
			child = LCHILD(i);
		

		if (RCHILD(i) < h.size && cmp(RCHILD(i), child, h, buf) > 0) 
			child = RCHILD(i);
	
		// heap property satisfied
		if (i == child) break;

		// swap with bigger child
		swap(buf, i, child);

		i = child; // move to bigger child

	}

	return i;
}

int insert (heap_ctx_t h, int *buf, int key) {
	if (h.size >= h.capacity)
		return -1;

	// insert element into heap
	int index = h.size++;
	buf[index] = key;

	return heapify_bup (h, buf, index);
}

int * extract (heap_ctx_t h, int *buf) {
	if (h.size == 0)
		return NULL;

	// swap top element with last
	// element and decrement heap size
	swap (buf, 0, --h.size);
	// restore heap property
	heapify_tdn (h, buf, 0);

	return buf + h.size;
}


void build_heap (int *buf, heap_ctx_t h) {
	// 1st non leaf node
	int i = h.size / 2 - 1; 
	
	// for all non leaf nodes heapify down
	while (i >= 0) heapify_tdn (h, buf, i--);
}

void heap_sort (int *buf, heap_ctx_t h) {
	build_heap (buf, h);

	while (extract(h, buf));
}
