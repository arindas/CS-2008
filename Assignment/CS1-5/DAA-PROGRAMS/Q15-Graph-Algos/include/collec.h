#ifndef collection_h
#define collection_h 

typedef int (* compare_fn) (void *, void *);

typedef struct _collection {
	
	void * 	(* search) (struct _collection, void *element); 

	int 	(* remove) (struct _collection, void *element);

	void *	(* add) (struct _collection, void *element);

	void *  (* pop) (struct _collection);

	void 	(* for_each) (struct _collection, 
			void (* action) (void *));

	void 	(* add_all) (struct _collection, struct _collection);

	int 	(* size) (struct _collection);
	
	int 	collection_id;
	void * 	collection_ctx;
	
	compare_fn compare;

} collection_t;

void std_add_all (collection_t this, collection_t that) {
	void add_action (void *elem) 
	{ this.add(this, elem); }

	that.for_each (that, add_action);
}

#endif
