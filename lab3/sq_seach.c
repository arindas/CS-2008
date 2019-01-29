#include <stdlib.h>
#include <stdio.h>

void find_complements(int *arr, int size, int key) {
	for(int i = 0; i < size; i++) {
		for(int j = i + 1; j < size; j++) {
			if(arr[i]*arr[i] + arr[j]*arr[j] == key) {
				printf("i: %d, j: %d\n", i, j); return;
			}
		}
	}
}

int main(int argc, char *args[]) {
	printf("Enter no. of elements: ");
	int size, key; scanf("%d", &size);
	int *arr = (int *)malloc(size * sizeof(int));
	printf("Enter %d elements:\n", size);
	for(int i = 0; i < size; i++) 
		scanf("%d", arr+i);
	printf("Enter key: "); scanf("%d", &key);
	find_complements(arr, size, key);
}
