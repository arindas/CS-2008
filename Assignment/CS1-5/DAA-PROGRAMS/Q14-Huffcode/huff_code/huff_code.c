#include <stdio.h>
#include <errno.h>
#include <string.h>

#include <heap.h>

#include <huff_code.h>

static int compare_char_greater_than_in_freq (
		void *p, int a, int b) {
	hcode_ctx_t *t = p;
	a = t->code_map[a].freq; 
	b = t->code_map[b].freq;
	return a > b? 1: a < b? -1: 0;
}

hcode_ctx_t hcode_ctx (int charset_len, int ctx_capacity) {
	
	hcode_ctx_t t = (hcode_ctx_t) {.code_map = NULL, 
		.char_map = NULL, .n_chars = 0, .ctx_capacity = 0 };

	t.code_map = malloc (sizeof(hcode_t) * N_HUFF_TREE);
	t.char_map = malloc (sizeof(int) * N_HUFF_TREE);

	if (!t.code_map || !t.char_map)
		errno = ENOMEM; 
	else { 
		t.charset_len = charset_len;
		t.n_chars = 0; // chars reg. 
		t.ctx_capacity = ctx_capacity; 
	}

	int i = t.n_chars; while (i-- > 0) {
		t.code_map[i] = (hcode_t) {.freq = 0, 
			.lchild = -1, .rchild = -1, .height = 1};
		t.char_map[i] = i;
	}

	return t;
}

void fill_code_map (hcode_ctx_t t, getc_fn getc) {
	if (!t.code_map || !t.char_map)
		return;
	
	int c; while ((c = getc()) != -1) 
		t.code_map[c % t.charset_len].freq++;	
}

void prune_hcode_ctx (hcode_ctx_t t) {
	int i = -1, p = 0;

	while (++i < t.charset_len) {
		int f = t.code_map[t.char_map[i]].freq;
		if (f > 0) swap(t.char_map, i, p++);
	}

	t.n_chars = p + 1;
}

#define _max(a, b) ((a) > (b)? (a): (b))

hcode_t * gen_huffman_tree (hcode_ctx_t t) {
	
	heap_ctx_t heap_ctx = (heap_ctx_t) { .size = t.n_chars, 
		.capacity = t.ctx_capacity, .compare_fn_ctx = (void *) &t, 
		.compare = compare_char_greater_than_in_freq }; 

	build_heap (t.char_map, heap_ctx);

	int c = t.charset_len, i = t.n_chars;

	int *root = NULL;

	while (--i > 0) {
		int *l = extract (heap_ctx, t.char_map), *r = NULL;
		if (l) r = extract (heap_ctx, t.char_map);
		
		if (!l) break;
		if (!r) { root = l; break; }

		hcode_t lc = t.code_map[*l], rc = t.code_map[*r];

		t.code_map[c] = (hcode_t) { .lchild = *l, .rchild = *r, 
			.freq = lc.freq + rc.freq, 
			.height = _max(lc.height, rc.height) + 1 };

		insert (heap_ctx, t.char_map, c++);
	}

	if (!root) root = extract (heap_ctx, t.char_map);

	return root? &t.code_map[*root]: NULL;
}

typedef struct {
	hcode_t 	*root;

	char 		*buffer;
	int 		cap;

	char 		*b_buf;
	int 		n_bytes;
	
	hcode 		*map;
	
	hcode_ctx_t hc_ctx;
} _gen_hcode_ctx_t;

static void _gen_hcode_map (_gen_hcode_ctx_t *, hcode_t *, char *);

static void _set_hcode (_gen_hcode_ctx_t *ctx, int l, char *p) {
	*(p++) = 0; int nbytes = p - ctx->buffer + 1;
	
	ctx->map[l].c_code = malloc (nbytes);
	
	// write character string
	char *dest = ctx->map[l].c_code;
	strcpy (dest, ctx->buffer);
	
	// write bit string
	dest = ctx->map[l].b_code;
	strncpy (dest, ctx->b_buf, ctx->n_bytes);
}

static void _write_bit (int pos, char *b_buf, char b) 
	{ b_buf[pos / 8] |= b << pos % 8; }

static void _get_hcode (_gen_hcode_ctx_t *ctx, char b, int i, char *p) {
	if (b) { _write_bit (p - ctx->buffer, ctx->b_buf, b); }
	
	*p = b + '0'; // set huffman code bit at p
	
	hcode_t *child = &ctx->hc_ctx.code_map[i];

	if (child->height == 0) _set_hcode (ctx, i, p);
	else _gen_hcode_map (ctx, child, p+1);
}

static void _gen_hcode_map (_gen_hcode_ctx_t *ctx, hcode_t *tree, char *p) {
	
	if (p - ctx->buffer >= ctx->cap) return;
	
	int l = tree->lchild;
	int r = tree->rchild;

	// traverse down lchild subtree
	if (l != -1) _get_hcode (ctx, 0, l, p);

	// traverse down rchild subtree
	if (r != -1) _get_hcode (ctx, 1, r, p);
}

hcode * gen_code_map (hcode_t *tree, hcode_ctx_t hc_ctx) {
	_gen_hcode_ctx_t ctx;
	ctx.root = tree;

	int n_max_bits = tree->height;
	ctx.cap = n_max_bits + 1;
	ctx.buffer = malloc (ctx.cap);
	
	int extra_byte = n_max_bits % 8 != 0;
	ctx.n_bytes = (n_max_bits >> 3) + extra_byte;
	ctx.b_buf = malloc (ctx.n_bytes);

	ctx.hc_ctx = hc_ctx;

	ctx.map = malloc (hc_ctx.charset_len * sizeof (hcode));

	_gen_hcode_map (&ctx, tree, ctx.buffer);

	return ctx.map;
}
