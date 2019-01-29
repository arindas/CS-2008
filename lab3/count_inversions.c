#include <stdlib.h>
#include <stdio.h>

int count_inversions(int *arr, int size) {
	int count = 0;
	for(int i = 0; i < size; i++) {
		for(int j = i+1; j < size; j++) {
			if(arr[j] < arr[i]) count++;
		}
	}
	return count;
}

int main(int argc, char *args[]) {
	printf("Enter no. of elements: ");
	int size, key; scanf("%d", &size);
	int *arr = (int *)malloc(size * sizeof(int));
	printf("Enter %d elements:\n", size);
	for(int i = 0; i < size; i++) 
		scanf("%d", arr+i);
	printf("No. of inversions: %d\n",
	count_inversions(arr, size));
}
