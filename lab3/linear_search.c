#include <stdio.h>
#include <stdlib.h>

int linear_search(int *arr, int size, int key) {
	for(int i = size-1; i >= 0; i--) {
		if(arr[i] == key) return i;
	}

	return -1;
}

int main(int argc, char *args[]) {
	printf("Enter no. of elements: ");
	int size, key; scanf("%d", &size);
	int *arr = (int *)malloc(size * sizeof(int));
	printf("Enter %d elements:\n", size);
	for(int i = 0; i < size; i++) 
		scanf("%d", arr+i);
	printf("Enter key: "); scanf("%d", &key);
	printf("Index: %d\n", linear_search(arr, size, key));
}
