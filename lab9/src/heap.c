#include <heap.h>
#include <alloc.h>

#include <stddef.h>

#define cmp(i, j, h) h.compare(h.buf[(i)], h.buf[(j)]) 

#define out_of_bounds(i, size) (i >= size || i < 0)

static void swap (void ** buf, int i, int j) 
{ void * t = buf[i]; buf[i] = buf[j]; buf[j] = t; }

heap_t * new_heap (allocator_t a, size_t cap, 
		compare_fn compare) {
	
	heap_t * 	h 	= a.alloc (sizeof (heap_t));
	void ** 	buf = a.alloc (sizeof (void *) * cap);

	if (!h || !buf) return NULL;

	*h = (heap_t) { .size = 0, .compare = compare, 
		.buf = buf, .capacity = cap, .allocator = a };

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

int heap_change_key (heap_t h, int index, void * key) { 
	if (out_of_bounds (index, h.size))
		return -1;
	
	h.buf[index] = key; 
	return heapify_tdn (h, heapify_bup (h, index)); 
}

void * heap_extract_from (heap_t h, int index) {
	// check for underflow or out of bounds
	if (h.size == 0 || out_of_bounds(index, h.size)) 
		return NULL;
	
	// save old key in a temp. var
	void * old_key = h.buf[index];
	// change key at index to key at last pos.
	heap_change_key (h, index, h.buf[--h.size]);
	
	return old_key;
}

static int _search (heap_t * h, void * key) {
	
	int i = h->size; while (i-- > 0) 
	{ if (h->compare(h->buf[i], key) == 0) return i; }
	
	return -1;
}

static void * search (collection_t this, void * key) {

	heap_t * h = this.collection_ctx;

	int i = _search (h, key);
	return i > -1? h->buf[i]: NULL;  
}

static int remove (collection_t this, void * key) {

	heap_t * h = this.collection_ctx;
	int i = _search (h, key);
	return heap_extract_from (*h, i) != NULL;
}

static void * add (collection_t this, void * element) {
	heap_t * h = this.collection_ctx;
	int index = heap_insert (*h, element);
	return index > -1? h->buf[index]: NULL;
}

static void * pop (collection_t this) {
	heap_t * h = this.collection_ctx;
	return heap_extract (*h);
}

static void for_each (collection_t this,
		void (* action) (void *)) {
	heap_t * h = this.collection_ctx;
	int i = h->size; while (i-- > 0)
	{ action (h->buf[i]); }
}

static int size (collection_t this) {
	heap_t * h = this.collection_ctx;
	return h->size;
}

collection_t heap_get_collection (heap_t * h) {
	
	return (collection_t) {
		.search 		= search,
		.remove 		= remove,
		.add 			= add,
		.pop			= pop,
		.for_each 		= for_each,
		.add_all 		= std_add_all,
		.size 			= size,
		.compare 		= h->compare,
		.collection_id  = HEAP_ID,
		.collection_ctx = h 
	};
} 
