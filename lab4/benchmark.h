#ifndef benchmark_h
#define benchmark_h

#include <stdio.h>
#include <time.h>

typedef struct { int *arr, start, end; } array_t;

void write_array(array_t t, FILE *f);

// typedef to abstract sorting algorithms
typedef void (*algorithm_t)(array_t t);

void generate_sorted_dataset (array_t t, int ascending);

void generate_randomized_data(array_t t);

typedef struct {
    clock_t average_case_time;
    clock_t best_case_time;
    clock_t worst_case_time;
} time_complexity_t;

void write_time_data(time_complexity_t t, FILE *f);

clock_t running_time(array_t t, algorithm_t algo);

time_complexity_t time_algorithm(array_t t, algorithm_t algo);

void write_benchmarks(algorithm_t algo, 
    int sample_size, int n_test_cases, FILE *f);

#endif
