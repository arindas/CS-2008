#ifndef collection_h
#define collection_h 

typedef struct _collection {
	
	void * 	(* search) (struct _collection, 
			void *element, int (*is_equal) (void *, void *)); 

	int 	(* remove) (struct _collection, 
			void *element, int (*is_equal) (void *, void *));

	void 	(* add) (struct _collection, void *element);

	void 	(* for_each) (struct _collection, 
			void (* action) (void *));

	void 	(* add_all) (struct _collection, struct _collection);

	int 	collection_id;
	void * 	collection_ctx;

} collection_t;

void std_add_all (collection_t, collection_t);

#endif
