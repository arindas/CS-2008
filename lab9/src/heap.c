#include <heap.h>
#include <alloc.h>

#include <stddef.h>

#define cmp(i, j, h) h.is_greater ( \
		h.compare_ctx, h.buf[(i)], h.buf[(j)]) 

#define out_of_bounds(i, size) (i >= size || i < 0)

static void swap (void ** buf, int i, int j) 
{ void * t = buf[i]; buf[i] = buf[j]; buf[j] = t; }

heap_t * get_heap (allocator_t a, size_t cap, 
		void * cmp_ctx, is_greater_fn is_greater) {
	
	heap_t * 	h 	= a.alloc (sizeof (heap_t));
	void ** 	buf = a.alloc (sizeof (void *) * cap);

	if (!h || !buf) return NULL;

	*h = (heap_t) { .size = 0, .compare_ctx = cmp_ctx, 
		.is_greater = is_greater, .buf = buf, 
		.capacity = cap, .allocator = a };

	return h;
}

int heapify_bup (heap_t h, int i) {
	if (out_of_bounds(i, h.size)) return -1;

	while (i > 0 && cmp(i, PARENT(i), h) > 0) 
	{ swap(h.buf, i, PARENT(i)); i = PARENT(i); }

	return i;
}

int heapify_tdn (heap_t h, int i) {
	if (out_of_bounds(i, h.size)) return -1;

	while(i < h.size) {
		int child = i, l = LCHILD(i), r = RCHILD(i);

		if (l < h.size && cmp(l, child, h) > 0) 
			child = l;
		

		if (r < h.size && cmp(r, child, h) > 0) 
			child = r;
	
		// heap property satisfied
		if (i == child) break;

		// swap with bigger child
		swap(h.buf, i, child);

		i = child; // move to bigger child

	}

	return i;
}

int heap_insert (heap_t h, void * key) {
	if (h.size >= h.capacity)
		return -1;

	// insert element into heap
	int index = h.size++;
	h.buf[index] = key;

	return heapify_bup (h, index);
}

void * heap_extract (heap_t h) {
	if (h.size == 0)
		return NULL;

	// swap top element with last
	// element and decrement heap size
	swap (h.buf, 0, --h.size);
	// restore heap property
	heapify_tdn (h, 0);

	return h.buf[h.size];
}

void heap_build (heap_t h) {

	// 1st non leaf node
	int i = h.size / 2 - 1; 
	
	// for all non leaf nodes heapify down
	while (i >= 0) heapify_tdn (h, i--);
}


