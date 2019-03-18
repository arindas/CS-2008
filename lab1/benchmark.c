#include <stdio.h>
#include <time.h>
#include <stdlib.h>

#include "benchmark.h"

void write_array(array_t t, FILE *f) {
    for(int i = t.start; i != t.end; i++)
        fprintf(f, "%d ", t.arr[i]);
}


void generate_sorted_dataset (array_t t, int ascending) {
    int start = 1, end = t.end - t.start + 1, step = 1;
    if(!ascending) { start = end; end = 1; step = -1; }

    for(int i = start; i != end; i += step) {
        t.arr[(i - start) / step + t.start] = i;
    }
}

void generate_randomized_data(array_t t) {
    for(int i = t.start; i < t.end; i++) {
        double random_elem = 1.0 * random() / RAND_MAX * (t.end - t.start + 1) + t.start;
        t.arr[i] = (int) random_elem;
    }
}

void write_time_data(time_complexity_t t, FILE *f) {
    fprintf(f, "%lf,%lf,%lf\n",
        1.0 * t.worst_case_time / CLOCKS_PER_SEC,
        1.0 * t.average_case_time / CLOCKS_PER_SEC,
        1.0 * t.best_case_time / CLOCKS_PER_SEC);
} 

clock_t running_time(array_t t, algorithm_t algo) {
    clock_t start = clock(), end; algo(t); end = clock(); 
    return end - start;
}

time_complexity_t time_algorithm(array_t t, algorithm_t algo) { 
    time_complexity_t complexity; clock_t start, end;

    // worst case time complexity
    generate_sorted_dataset(t, 0); 
    complexity.worst_case_time = running_time(t, algo);

    // average case time complexity
    generate_randomized_data(t);
    complexity.average_case_time = running_time(t, algo);

    // best case time complexity
    generate_sorted_dataset(t, 1);
    complexity.best_case_time = running_time(t, algo);
    
    return complexity;
}

void write_benchmarks(algorithm_t algo, 
    int sample_size, int n_test_cases, FILE *f) {
    
    fprintf(f, "%s,%s,%s,%s\n", 
        "size", "worst_case", "average_case", "best_case");

    for(int i = 1; i < n_test_cases; i++) {
        int size = sample_size * i;
        int *arr = malloc(size * sizeof(int));
        array_t t = (array_t) { .arr = arr,
            .start = 0, .end = size};
        fprintf(f, "%d,", size);
        write_time_data(time_algorithm(t, algo), f);
        free(arr);
    }
}
