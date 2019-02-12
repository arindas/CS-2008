#include <stdio.h>
#include <stdlib.h>

#include "heap.h"

int main(int argc, char *args[]) {
	
	int comp(int i, int j) 
	{ return i>j?1:i<j?-1:0; }
	
	heap_t *H = new_heap (20, comp);

	for(int i = 0; i < 20; i++) {
		int num = random() % 100;		
		// printf("Inserting: %d\n", num);
		insert(H, num);
	}

	int size = H->size;

	while(H->size > 0) {
		int i = *extract(H);
		// printf("Extracting: %d\n", i);
	}

	printf("Sorted array:\n");
	for(int i = 0; i < size; i++) {
		printf("%d ", H->arr[i]);
	} printf("\n");

	return 0;
}
