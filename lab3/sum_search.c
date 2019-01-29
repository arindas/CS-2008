#include <stdio.h>
#include <stdlib.h>


typedef struct { int a, b; } pair;

pair binary_search(int *arr, int size, int key) {
	int lb=0, ub=size-1;
	int mid = (lb+ub)/2;
	int rlb, rub;
	while(lb <= ub) {
		int mid = (lb+ub)/2;
		rlb = lb;
		rub = ub;
		if(key < arr[mid]) 
			ub = mid-1;
		else 
			lb = mid+1;
	}

	return (pair){.a = rlb, .b = rub};
}

void find_indices(int *arr, int size, int key) {
	for(int i = 0; i < size; i++) {
		for(int j = i+1; j < size; j++) {
			for(int k = j+1; k < size; k++) {
				if(arr[i]+arr[j]+arr[k] == key) {
					printf("i: %d, j: %d, k: %d\n",
						i, j, k); return;
				}
			}
		}
	}
	printf("not found.\n");
}

int main(int argc, char *args[]) {
	printf("Enter no. of elements: ");
	int size, key; scanf("%d", &size);
	int *arr = (int *)malloc(size * sizeof(int));
	printf("Enter %d elements:\n", size);
	for(int i = 0; i < size; i++) 
		scanf("%d", arr+i);
	printf("Enter key: "); scanf("%d", &key);
	find_indices(arr, size, key);
}
