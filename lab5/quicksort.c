#include <stdlib.h>
#include <time.h>
#include <stdio.h>

typedef struct { int *arr, start, end; } array_t;

void write_array(array_t t, FILE *f) {
	for(int i = t.start; i <= t.end; i++)
		fprintf(f, "%d ", t.arr[i]);
}

void swap(int *arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
} 

int randomized_int(int start, int end) {
	return 1.0 * random() / RAND_MAX * (end - start+1) + start;
}

int partition(array_t t, int israndomized) {
    int pivot = !israndomized? t.end:
		randomized_int(t.start, t.end);
	// save pivot to start of array
    swap(t.arr, t.start, pivot);
    int last = t.start;
    for(int i = t.start+1; i <= t.end; i++) {
        if(t.arr[i] < t.arr[t.start]) {
            swap(t.arr, ++last, i);
        }
    }
    // restore pivot
    swap(t.arr, t.start, last);

    return last;
}

void quick_sort(array_t t, int randomized) {
    if (t.start >= t.end)
        return;
    int p = partition(t, randomized);
    quick_sort((array_t){.arr = t.arr,
     .start = t.start, .end = p-1}, randomized);
    quick_sort((array_t){.arr = t.arr,
     .start = p+1, .end = t.end},   randomized);
}

void generate_dataset(array_t t) {
	for(int i = t.start; i <= t.end; i++) {
		t.arr[i] = randomized_int(t.start, t.end);
	}
}

typedef void (*fn)(array_t t, int i);

clock_t running_time(fn f, array_t t, int i) {
	clock_t start = clock(), end;
	f(t, i); end = clock(); 
	return end - start;
}

void print_benchmarks(int sample_size, int ntestcases) {
	printf("size,averg,worst\n");
	for(int i = 1; i <= ntestcases; i++) {
		int size = i*sample_size;
		array_t t = (array_t) {
			.arr = (int *) malloc(sizeof(int) * size),
			.start = 0, .end = size - 1};
		generate_dataset(t);
		clock_t averg = running_time(quick_sort, t, 1);
		clock_t worst = running_time(quick_sort, t, 1);

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
	quick_sort(t, 0);
	clock_t end = clock();
    write_array(t, stdout);
    printf("\ntime = %ld\n", end - start);
 	start = clock();
	quick_sort(t, 0);
	end = clock();
 	write_array(t, stdout);
	printf("\ntime = %ld\n", end - start);

    *******************************/
	
	print_benchmarks(1000, 20);

    return 0;
}
