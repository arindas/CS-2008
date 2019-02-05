#include <stdlib.h>
#include <stdio.h>
#include <time.h>

typedef struct { int *arr, start, end; } array_t;

void write_array(array_t t, FILE *f) {
	for(int i = t.start; i <= t.end; i++)
		fprintf(f, "%d ", t.arr[i]);
}

#define LEFT(i)   2*(i)+1
#define RIGHT(i)  2*(i)+2
#define PARENT(i) ((i)-1)/2

int randomized_int(int start, int end) {
	return 1.0 * random() / RAND_MAX * (end - start+1) + start;
}

void swap(int *arr, int i, int j) {
	int temp = arr[i];
	arr[i] = arr[j]; 
	arr[j] = temp;
}

void heapify_down(array_t t, int i, int end) {
	if(i < t.start || i > end)
		return;

	int largest = i;
	int l = LEFT(i), r = RIGHT(i);

	if(l <= end && t.arr[l] > t.arr[largest])
		largest = l;
	if(r <= end && t.arr[r] > t.arr[largest])
		largest = r;

	if (largest != i) {
		swap(t.arr, i, largest);
		heapify_down(t, largest, end);
	}
}

void build_max_heap(array_t t) {
	int l = t.end - t.start+1;
	for(int i = t.start+l/2;
		i >= t.start; i--) {
		heapify_down(t, i, t.end);
	}
}

void heap_sort(array_t t) {
	build_max_heap(t);
	for(int i = t.end; i >= t.start; i--) {
		swap(t.arr, t.start, i);
		heapify_down(t, t.start, i-1);
	}
}

void generate_dataset(array_t t) {
	for(int i = t.start; i <= t.end; i++) {
		t.arr[i] = randomized_int(t.start, t.end);
	}
}

clock_t running_time(array_t t) {
	clock_t start = clock(), end;
	heap_sort(t); end = clock(); 
	return end - start;
}

void print_benchmarks(int sample_size, int ntestcases) {
	printf("size,unsorted,sorted\n");
	for(int i = 1; i <= ntestcases; i++) {
		int size = i*sample_size;
		array_t t = (array_t) {
			.arr = (int *) malloc(sizeof(int) * size),
			.start = 0, .end = size - 1};
		generate_dataset(t);
		clock_t averg = running_time(t);
		clock_t worst = running_time(t);

		printf("%d,%ld,%ld\n", size, averg, worst);
		free(t.arr);
	}
} 

int main(int argc, char *args[]) {
    /******************************
	array_t t = (array_t) { 
         .arr = malloc(20 * sizeof(int)),
         .start = 0, .end = 19 };
    generate_dataset(t);
    printf("Unsorted array:\n");
    write_array(t, stdout);
    printf("\nSorted array:\n");
    clock_t start = clock();
	heap_sort(t);
	clock_t end = clock();
    write_array(t, stdout);
    printf("\ntime = %ld\n", end - start);
 	start = clock();
	heap_sort(t);
	end = clock();
 	write_array(t, stdout);
	printf("\ntime = %ld\n", end - start);

    *******************************/
	
	print_benchmarks(1000, 50);

    return 0;
}
