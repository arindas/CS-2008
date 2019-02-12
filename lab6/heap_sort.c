#include "heap.h"

#include <stdio.h>

// sorts [start...end]
void heap_sort(int *arr, int start, int end) {
	arr += start; int size = end - start + 1;

	int compare(int i, int j)
	{ return i>j?1:i<j?-1:0; }

	heap_t *H = buildHeap(arr, size, compare);
	while(H->size > 0) extract(H);
}

int main(int argc, char *args[]) {
	
	printf("Enter size: ");
	int size; scanf("%d", &size);

	int arr[size];

	printf("Original array:\n");
	for(int i = 0; i < size; i++) {
		arr[i] = random() % 100;
		printf("%d ", arr[i]);
	}

	heap_sort(arr, 0, size-1);

	printf("\nSorted array:\n");
	for(int i = 0; i < size; i++)
		printf("%d ", arr[i]);

	printf("\n"); return 0;
}
