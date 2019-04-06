#include <collection.h>

void std_add_all (collection_t this, collection_t that) {
	void add_action (void *elem) 
	{ this.add(this, elem); }

	that.for_each (that, add_action);
}


