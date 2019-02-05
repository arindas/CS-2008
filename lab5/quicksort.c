#include "../benchmark.h"
#include <stdlib.h>

void swap(int *arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
} 

int partition(array_t t) {
    int pivot = (t.start + t.end) / 2;
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

void quick_sort(array_t t) {
    if (t.start >= t.end)
        return;
    int p = partition(t);
    quick_sort((array_t){.arr = t.arr,
     .start = t.start, .end = p});
    quick_sort((array_t){.arr = t.arr,
     .start = p+1, .end = t.end});
}

int main(int argc, char *args[]) {
    // array_t t = (array_t) { 
    //     .arr = malloc(100 * sizeof(int)),
    //     .start = 0, .end = 100 };
    // generate_randomized_data(t);
    // printf("Unsorted array:\n");
    // write_array(t, stdout);
    // printf("\nSorted array:\n");
    // quick_sort(t);
    // write_array(t, stdout);
    // printf("\n");
    
    write_benchmarks(quick_sort, 1000, 100, stdout);
    
    return 0;
}