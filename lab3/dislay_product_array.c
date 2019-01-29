#include <stdio.h>
#include <stdlib.h>

void display(int *arr, int size) {
	int product  = 1;
	for(int i = 0; i < size; i++) {
		product *= arr[i];
	}

	for(int i = 0; i < size; i++) {
		printf("%d ", product/arr[i]);
	}
}

int main(int argc, char *args[]) {
	printf("Enter no. of elements: ");
	int size, key; scanf("%d", &size);
	int *arr = (int *)malloc(size * sizeof(int));
	printf("Enter %d elements:\n", size);
	for(int i = 0; i < size; i++) 
		scanf("%d", arr+i);
	display(arr, size);
}
