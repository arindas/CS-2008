#include <stdio.h>

#include "../benchmark.h"

void insertion_sort(array_t t) {
    for(int i = t.start + 1; i < t.end; i++) {
        int elem = t.arr[i]; int j;

        for(j = i-1; j >= t.start && elem < t.arr[j]; j--) {
            t.arr[j+1] = t.arr[j];
        }

        t.arr[j+1] = elem;
    }
}

int main(int argc, char *args[]) {
    write_benchmarks(insertion_sort, 1000, 50, stdout);
}
