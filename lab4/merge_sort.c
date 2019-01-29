#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "../benchmark.h"

void merge(array_t t, int mid) {
	int n1 = mid - t.start+1, n2 = t.end - mid;
	
	size_t size = n1 + n2;

	int *A = malloc(size * sizeof(int));

	for(int i = 0; i < size; i++) 
		A[i] = t.arr[i+t.start];

	int i = 0, j = 0, k = t.start;
	while(i < n1 && j < n2) {
		if(A[i] < A[j]) 
			t.arr[k++] = A[i++];
		else
			t.arr[k++] = A[n1 + j++];
	}

	while(i < n1) 
		t.arr[k++] = A[i++];
	
	while(j < n2)
		t.arr[k++] = A[n1 + j++];
	
	free(A);

}

void merge_sort(array_t t) {
	if(t.start >= t.end)
		return;
	int mid = (t.start + t.end) / 2;
	
	array_t L = (array_t){.arr = t.arr,
		.start = t.start, .end = mid};
	array_t R = (array_t){.arr = t.arr,
		.start = mid+1, .end = t.end};
	
	merge_sort(L);
	merge_sort(R);
	merge(t, mid);
}

int main(int argc, char *args[]) {
    write_benchmarks(merge_sort, 1000, 50, stdout);
}
