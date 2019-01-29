#include <stdlib.h>
#include <strings.h>
#include <stdio.h>
#include <time.h>
#include <errno.h>

static int arr[50000];

void initialize() { bzero(arr, 50000*sizeof(int)); }

// void deallocate_store() { free(arr); }

void selection_sort(int *arr, int size) {
	for(int i = size-1; i > 0; i--) {
		// assume the first element to be the largest element
		int largest = arr[0], index = 0;
		// search for the largest element in the subarray
		for(int j = 1; j <= i; j++) {
			if(arr[j] > largest) 
			{ largest = arr[j]; index = j; }
		}
		// place largest element at the end of subarray
		arr[index] = arr[i]; arr[i] = largest;
	}
}

void generate_data(int low, int high, int ascending) {
	int start, end, step;
	if (ascending) { start = low; end = high; step = 1; }
	else { start = high; end = low; step = -1; }
	
	for(int i = start; i != end; i+=step){
		arr[(i - start) / step] = i;
	}
} 

void generate_randomized_data(int low, int high, int size) {
	for(int i = 0; i < size; i++) {
		double random = 1.0 * rand() / 
			RAND_MAX * (low - high + 1) + low;
		arr[i] = (int) random;
	}
}

clock_t time_selection_sort(int *arr, int size) {
	clock_t before = clock(), after;
	selection_sort(arr, size);
	after = clock();
	return after - before;
}

typedef struct {
	clock_t worst_case_time;
	clock_t best_case_time;
	clock_t average_case_time;
} time_data;

time_data time_for_sample(int sample_size) {
	clock_t worst_case, best_case, average_case; int *arr1, *arr2, *arr3;

	generate_data(1, sample_size, 1);
	best_case = time_selection_sort(arr, sample_size);
	initialize();	
	generate_data(1, sample_size, 0);
	worst_case = time_selection_sort(arr, sample_size);
	initialize();
	generate_randomized_data(1, sample_size, sample_size);
	average_case = time_selection_sort(arr, sample_size);
	initialize();


	return (time_data){.worst_case_time = worst_case,
		.best_case_time = best_case,
		.average_case_time = average_case};
}

void write_time_data(time_data data) {
	printf("%15lf,%15lf,%15lf\n",
		1.0 * data.best_case_time    /CLOCKS_PER_SEC,
		1.0 * data.average_case_time /CLOCKS_PER_SEC,
		1.0 * data.worst_case_time   /CLOCKS_PER_SEC);
} 

void write_data() {
	printf("%-15s,%15s,%15s,%15s\n","sample_size",
		"best_case", "average_case", "worst_case" );

	for(int i = 1; i <= 50; i++) { 
		int sample_size = i*1000; printf("%-15d,", sample_size);
		write_time_data(time_for_sample(sample_size));
	}
}

void main() { 
	// allocate_storage(); 
	write_data(); 
	// deallocate_store(); 
}
