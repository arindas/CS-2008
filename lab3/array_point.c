#include <stdio.h>
#include <stdlib.h>

int findK(int *arr, int size) {
	for(int i = 0; i < size-1; i++) {
		if(arr[i] > arr[i+1]) return i;
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
	
	printf("k: %d\n", findK(arr, size));
}	
