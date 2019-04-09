#include <stdlib.h>
#include <errno.h>

void * std_alloc_fn (size_t size) {
	void * p = malloc (size);

	if (!p) 
		errno = ENOMEM;

	return p;
}

void std_free_fn (void *p) {
	if (p) 
		free(p);
}

