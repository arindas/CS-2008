#ifndef huff_code_h
#define huff_code_h

#define N_CHAR_SET 256
#define N_HUFF_TREE (N_CHAR_SET * 2 - 1)

typedef struct {
	int freq;

	int lchild;
	int rchild;

	int height;
} hcode_t;

typedef struct {
	hcode_t *code_map;
	int 	*char_map;
	
	int 	charset_len;
	int 	n_chars;

	int 	ctx_capacity;
} hcode_ctx_t;

hcode_ctx_t hcode_ctx (int charset_len, int ctx_capacity);

typedef int (*getc_fn) ();

void fill_code_map (hcode_ctx_t t, getc_fn getc); 

void prune_hcode_ctx (hcode_ctx_t t);

hcode_t * gen_huffman_tree (hcode_ctx_t t);


typedef struct { char *c_code, *b_code; } hcode;

hcode * gen_code_map (hcode_t *tree, hcode_ctx_t); 

#endif 
