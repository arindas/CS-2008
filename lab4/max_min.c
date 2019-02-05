#include <stdio.h>

static int max, min, uninitialized = 1;

void iterative_max_min(array_t t) {
	max = min = t.arr[t.start];
	
	for(int i = t.start+1; i < t.end; i++) {
		if(t.arr[i] > max) max = t.arr[i];
		if(t.arr[i] < min) min = t.arr[i];
	}
}

void compare(int max_, int min_) {
	if(uninitialized) {
		max = max_; min = min_; 
		uinitialized = 0;
	} else {
		max = max_ > max? max_: max;
		min = min_ < min? min_: min;
	}
}

void dnc_max_min(array_t t) {
	if (t.start > t.end)
		return;
	
	// single element
	if (t.end - t.start == 1) {
		compare(t.arr[t.start], t.arr[t.start]);
	} 
	// Array contains exactly 2 elements
	// Note: If we do not provide this condition
	// the perfomance of this algorithm reduces
	// to a simple straight_max_min
	else if(t.end - t.start == 2) {
		int max_ = t.arr[t.start] > t.arr[t.start+1]?
			t.arr[t.start]: t.arr[t.start+1];
		int min_ = t.arr[t.start] + t.arr[t.start+1] - max_;
		compare(max_, min_);
	} 
	
	else {
		int mid = (t.start + t.end) / 2;
		array_t L = (array_t){.arr = t.arr,
			.start = t.start, .end = mid};
		array_t R = (array_t){.arr = t.arr,
			.start = mid+1, .end = t.end};

		dnc_max_min(L);
		dnc_max_min(R);
	}
	
}


