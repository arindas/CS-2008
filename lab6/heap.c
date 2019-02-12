#include "heap.h"

#include <stdlib.h>
#include <errno.h>

heap_t *new_heap (size_t capacity, compareFn compare) {
	int *arr = malloc (capacity * sizeof(int));
	heap_t *h = malloc (sizeof (heap_t));
	if(arr == NULL || h == NULL) 
		{ errno = ENOMEM; return NULL; }
	
	*h = (heap_t) {.arr = arr, .size = 0,
		.capacity = capacity, .compare = compare };

	return h;
}

void free_heap (heap_t *heap) {
	free(heap->arr);

	*heap = (heap_t) {.arr = NULL, 
		.size = 0, .capacity = 0 };
}

static void swap (int *arr, int i, int j) {
	int temp = arr[i];
	arr[i] = arr[j];
	arr[j] = temp;
}

int heapifyUp (heap_t *heap, int i) {
	if (i >= heap->size || i < 0)
		return -1;

	while (i > 0 && 
		heap->compare(heap->arr[i], heap->arr[PARENT(i)]) > 0) {
		swap(heap->arr, i, PARENT(i)); i = PARENT(i);
	}

	return i;
}

int heapifyDown (heap_t *heap, int i) {
	if (i >= heap->size || i < 0)
		return -1;

	while(i < heap->size) {
		int child = i;

		if (LEFT(i) < heap->size &&
			heap->compare(heap->arr[child],
				heap->arr[LEFT(i)]) < 0) {
			
			child = LEFT(i);
		}

		if (RIGHT(i) < heap->size &&
			heap->compare(heap->arr[child],
				heap->arr[RIGHT(i)]) < 0) {
			
			child = RIGHT(i);
		}

		// heap property satisfied
		if (i == child) break;

		// swap with bigger child
		swap(heap->arr, i, child);

		i = child; // move to bigger child

	}

	return i;
}

int insert (heap_t *heap, int key) {
	if (heap->size >= heap->capacity)
		return -1;

	// insert element into heap
	int index = heap->size++;
	heap->arr[index] = key;

	return heapifyUp(heap, index);
}

int * extract (heap_t *heap) {
	if (heap->size == 0)
		return NULL;

	// swap top element with last
	// element and decrement heap size
	swap (heap->arr, 0, --heap->size);
	// restore heap property
	heapifyDown(heap, 0);

	return heap->arr + heap->size;
}


heap_t * buildHeap(int *arr, int size, compareFn c) {
	heap_t *h = malloc (sizeof (heap_t));

	if (h == NULL) { errno = ENOMEM; return NULL; }

	*h = (heap_t) {.arr = arr, .size = size,
		.capacity = size, .compare = c};

	// apply heapify() on non leaf nodes only
	for (int i = size/2; i >= 0; i--) {
		heapifyDown(h, i);
	}

	return h;
}


