
huff_code.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <compare_char_greater_than_in_freq>:
#include <huff_code.h>

static int compare_char_greater_than_in_freq (
		void *p, int a, int b) {
	hcode_ctx_t *t = p;
	a = t->code_map[a].freq; 
   0:	48 8b 0f             	mov    (%rdi),%rcx
   3:	48 63 f6             	movslq %esi,%rsi
	b = t->code_map[b].freq;
   6:	48 63 d2             	movslq %edx,%rdx
	return a > b? 1: a < b? -1: 0;
   9:	b8 01 00 00 00       	mov    $0x1,%eax
	b = t->code_map[b].freq;
   e:	48 c1 e2 04          	shl    $0x4,%rdx
	a = t->code_map[a].freq; 
  12:	48 c1 e6 04          	shl    $0x4,%rsi
	return a > b? 1: a < b? -1: 0;
  16:	8b 3c 11             	mov    (%rcx,%rdx,1),%edi
  19:	39 3c 31             	cmp    %edi,(%rcx,%rsi,1)
  1c:	7f 08                	jg     26 <compare_char_greater_than_in_freq+0x26>
  1e:	0f 9c c0             	setl   %al
  21:	0f b6 c0             	movzbl %al,%eax
  24:	f7 d8                	neg    %eax
}
  26:	c3                   	retq   
  27:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  2e:	00 00 

0000000000000030 <_get_hcode>:
}

static void _write_bit (int pos, char *b_buf, char b) 
	{ b_buf[pos / 8] |= b << pos % 8; }

static void _get_hcode (_gen_hcode_ctx_t *ctx, char b, int i, char *p) {
  30:	41 55                	push   %r13
  32:	41 54                	push   %r12
  34:	55                   	push   %rbp
  35:	48 89 fd             	mov    %rdi,%rbp
  38:	48 89 cf             	mov    %rcx,%rdi
  3b:	53                   	push   %rbx
  3c:	48 83 ec 08          	sub    $0x8,%rsp
	if (b) { _write_bit (p - ctx->buffer, ctx->b_buf, b); }
  40:	40 84 f6             	test   %sil,%sil
  43:	74 35                	je     7a <_get_hcode+0x4a>
  45:	48 2b 4d 08          	sub    0x8(%rbp),%rcx
	{ b_buf[pos / 8] |= b << pos % 8; }
  49:	85 c9                	test   %ecx,%ecx
  4b:	8d 41 07             	lea    0x7(%rcx),%eax
  4e:	41 89 c8             	mov    %ecx,%r8d
  51:	0f 49 c1             	cmovns %ecx,%eax
  54:	41 c1 f8 1f          	sar    $0x1f,%r8d
  58:	41 c1 e8 1d          	shr    $0x1d,%r8d
  5c:	44 01 c1             	add    %r8d,%ecx
  5f:	c1 f8 03             	sar    $0x3,%eax
  62:	83 e1 07             	and    $0x7,%ecx
  65:	48 98                	cltq   
  67:	48 03 45 18          	add    0x18(%rbp),%rax
  6b:	44 29 c1             	sub    %r8d,%ecx
  6e:	41 b8 01 00 00 00    	mov    $0x1,%r8d
  74:	41 d3 e0             	shl    %cl,%r8d
  77:	44 08 00             	or     %r8b,(%rax)
	
	*p = b + '0'; // set huffman code bit at p
  7a:	83 c6 30             	add    $0x30,%esi
	
	hcode_t *child = &ctx->hc_ctx.code_map[i];
  7d:	48 63 d2             	movslq %edx,%rdx
  80:	4c 8d 67 01          	lea    0x1(%rdi),%r12
	*p = b + '0'; // set huffman code bit at p
  84:	40 88 37             	mov    %sil,(%rdi)
	hcode_t *child = &ctx->hc_ctx.code_map[i];
  87:	48 8b 45 30          	mov    0x30(%rbp),%rax
  8b:	48 c1 e2 04          	shl    $0x4,%rdx
  8f:	48 01 d0             	add    %rdx,%rax

	if (child->height == 0) _set_hcode (ctx, i, p);
  92:	8b 48 0c             	mov    0xc(%rax),%ecx
  95:	85 c9                	test   %ecx,%ecx
  97:	75 47                	jne    e0 <_get_hcode+0xb0>
	*(p++) = 0; int nbytes = p - ctx->buffer + 1;
  99:	c6 07 00             	movb   $0x0,(%rdi)
  9c:	4c 8b 6d 08          	mov    0x8(%rbp),%r13
	ctx->map[l].c_code = malloc (nbytes);
  a0:	48 8b 5d 28          	mov    0x28(%rbp),%rbx
	*(p++) = 0; int nbytes = p - ctx->buffer + 1;
  a4:	4d 29 ec             	sub    %r13,%r12
  a7:	41 8d 7c 24 01       	lea    0x1(%r12),%edi
	ctx->map[l].c_code = malloc (nbytes);
  ac:	48 01 d3             	add    %rdx,%rbx
  af:	48 63 ff             	movslq %edi,%rdi
  b2:	e8 00 00 00 00       	callq  b7 <_get_hcode+0x87>
	strcpy (dest, ctx->buffer);
  b7:	4c 89 ee             	mov    %r13,%rsi
	ctx->map[l].c_code = malloc (nbytes);
  ba:	48 89 03             	mov    %rax,(%rbx)
	strcpy (dest, ctx->buffer);
  bd:	48 89 c7             	mov    %rax,%rdi
  c0:	e8 00 00 00 00       	callq  c5 <_get_hcode+0x95>
	strncpy (dest, ctx->b_buf, ctx->n_bytes);
  c5:	48 63 55 20          	movslq 0x20(%rbp),%rdx
  c9:	48 8b 75 18          	mov    0x18(%rbp),%rsi
  cd:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
	else _gen_hcode_map (ctx, child, p+1);
}
  d1:	48 83 c4 08          	add    $0x8,%rsp
  d5:	5b                   	pop    %rbx
  d6:	5d                   	pop    %rbp
  d7:	41 5c                	pop    %r12
  d9:	41 5d                	pop    %r13
	strncpy (dest, ctx->b_buf, ctx->n_bytes);
  db:	e9 00 00 00 00       	jmpq   e0 <_get_hcode+0xb0>

static void _gen_hcode_map (_gen_hcode_ctx_t *ctx, hcode_t *tree, char *p) {
	
	if (p - ctx->buffer >= ctx->cap) return;
  e0:	48 63 55 10          	movslq 0x10(%rbp),%rdx
  e4:	4c 89 e1             	mov    %r12,%rcx
  e7:	48 2b 4d 08          	sub    0x8(%rbp),%rcx
  eb:	48 39 d1             	cmp    %rdx,%rcx
  ee:	7d 10                	jge    100 <_get_hcode+0xd0>
	
	int l = tree->lchild;
  f0:	8b 50 04             	mov    0x4(%rax),%edx
	int r = tree->rchild;
  f3:	8b 58 08             	mov    0x8(%rax),%ebx

	// traverse down lchild subtree
	if (l != -1) _get_hcode (ctx, 0, l, p);
  f6:	83 fa ff             	cmp    $0xffffffff,%edx
  f9:	75 35                	jne    130 <_get_hcode+0x100>

	// traverse down rchild subtree
	if (r != -1) _get_hcode (ctx, 1, r, p);
  fb:	83 fb ff             	cmp    $0xffffffff,%ebx
  fe:	75 10                	jne    110 <_get_hcode+0xe0>
}
 100:	48 83 c4 08          	add    $0x8,%rsp
 104:	5b                   	pop    %rbx
 105:	5d                   	pop    %rbp
 106:	41 5c                	pop    %r12
 108:	41 5d                	pop    %r13
 10a:	c3                   	retq   
 10b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 110:	48 83 c4 08          	add    $0x8,%rsp
	if (r != -1) _get_hcode (ctx, 1, r, p);
 114:	4c 89 e1             	mov    %r12,%rcx
 117:	89 da                	mov    %ebx,%edx
 119:	48 89 ef             	mov    %rbp,%rdi
}
 11c:	5b                   	pop    %rbx
	if (r != -1) _get_hcode (ctx, 1, r, p);
 11d:	be 01 00 00 00       	mov    $0x1,%esi
}
 122:	5d                   	pop    %rbp
 123:	41 5c                	pop    %r12
 125:	41 5d                	pop    %r13
	if (r != -1) _get_hcode (ctx, 1, r, p);
 127:	e9 04 ff ff ff       	jmpq   30 <_get_hcode>
 12c:	0f 1f 40 00          	nopl   0x0(%rax)
	if (l != -1) _get_hcode (ctx, 0, l, p);
 130:	31 f6                	xor    %esi,%esi
 132:	4c 89 e1             	mov    %r12,%rcx
 135:	48 89 ef             	mov    %rbp,%rdi
 138:	e8 f3 fe ff ff       	callq  30 <_get_hcode>
	if (r != -1) _get_hcode (ctx, 1, r, p);
 13d:	83 fb ff             	cmp    $0xffffffff,%ebx
 140:	74 be                	je     100 <_get_hcode+0xd0>
 142:	eb cc                	jmp    110 <_get_hcode+0xe0>
 144:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
 14b:	00 00 00 00 
 14f:	90                   	nop

0000000000000150 <swap>:
int * extract (heap_ctx_t, int *buf);

void build_heap (int *buf, heap_ctx_t);

void swap (int *buf, int i, int j) 
{ int t = buf[i]; buf[i] = buf[j]; buf[j] = t;}
 150:	48 63 f6             	movslq %esi,%rsi
 153:	48 63 d2             	movslq %edx,%rdx
 156:	48 8d 0c b7          	lea    (%rdi,%rsi,4),%rcx
 15a:	48 8d 04 97          	lea    (%rdi,%rdx,4),%rax
 15e:	8b 31                	mov    (%rcx),%esi
 160:	8b 10                	mov    (%rax),%edx
 162:	89 11                	mov    %edx,(%rcx)
 164:	89 30                	mov    %esi,(%rax)
 166:	c3                   	retq   
 167:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
 16e:	00 00 

0000000000000170 <hcode_ctx>:
hcode_ctx_t hcode_ctx (int charset_len, int ctx_capacity) {
 170:	41 56                	push   %r14
 172:	41 89 d6             	mov    %edx,%r14d
 175:	41 55                	push   %r13
 177:	41 89 f5             	mov    %esi,%r13d
 17a:	41 54                	push   %r12
 17c:	49 89 fc             	mov    %rdi,%r12
	t.code_map = malloc (sizeof(hcode_t) * N_HUFF_TREE);
 17f:	bf f0 1f 00 00       	mov    $0x1ff0,%edi
hcode_ctx_t hcode_ctx (int charset_len, int ctx_capacity) {
 184:	55                   	push   %rbp
 185:	53                   	push   %rbx
 186:	48 83 ec 10          	sub    $0x10,%rsp
	t.code_map = malloc (sizeof(hcode_t) * N_HUFF_TREE);
 18a:	e8 00 00 00 00       	callq  18f <hcode_ctx+0x1f>
	t.char_map = malloc (sizeof(int) * N_HUFF_TREE);
 18f:	bf fc 07 00 00       	mov    $0x7fc,%edi
	t.code_map = malloc (sizeof(hcode_t) * N_HUFF_TREE);
 194:	48 89 c3             	mov    %rax,%rbx
	t.char_map = malloc (sizeof(int) * N_HUFF_TREE);
 197:	e8 00 00 00 00       	callq  19c <hcode_ctx+0x2c>
 19c:	48 89 c5             	mov    %rax,%rbp
	if (!t.code_map || !t.char_map)
 19f:	48 85 c0             	test   %rax,%rax
 1a2:	74 4c                	je     1f0 <hcode_ctx+0x80>
 1a4:	48 85 db             	test   %rbx,%rbx
 1a7:	74 47                	je     1f0 <hcode_ctx+0x80>
	int i = t.n_chars; while (i-- > 0) {
 1a9:	41 8d 55 ff          	lea    -0x1(%r13),%edx
 1ad:	45 85 ed             	test   %r13d,%r13d
 1b0:	7e 4f                	jle    201 <hcode_ctx+0x91>
 1b2:	49 63 fd             	movslq %r13d,%rdi
 1b5:	48 63 c2             	movslq %edx,%rax
 1b8:	66 0f 6f 05 00 00 00 	movdqa 0x0(%rip),%xmm0        # 1c0 <hcode_ctx+0x50>
 1bf:	00 
 1c0:	89 d2                	mov    %edx,%edx
 1c2:	48 83 ef 02          	sub    $0x2,%rdi
 1c6:	48 29 d7             	sub    %rdx,%rdi
 1c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
		t.code_map[i] = (hcode_t) {.freq = 0, 
 1d0:	48 89 c1             	mov    %rax,%rcx
		t.char_map[i] = i;
 1d3:	89 44 85 00          	mov    %eax,0x0(%rbp,%rax,4)
 1d7:	48 83 e8 01          	sub    $0x1,%rax
		t.code_map[i] = (hcode_t) {.freq = 0, 
 1db:	48 c1 e1 04          	shl    $0x4,%rcx
 1df:	0f 11 04 0b          	movups %xmm0,(%rbx,%rcx,1)
	int i = t.n_chars; while (i-- > 0) {
 1e3:	48 39 f8             	cmp    %rdi,%rax
 1e6:	75 e8                	jne    1d0 <hcode_ctx+0x60>
 1e8:	eb 17                	jmp    201 <hcode_ctx+0x91>
 1ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
		errno = ENOMEM; 
 1f0:	e8 00 00 00 00       	callq  1f5 <hcode_ctx+0x85>
	hcode_ctx_t t = (hcode_ctx_t) {.code_map = NULL, 
 1f5:	45 31 f6             	xor    %r14d,%r14d
 1f8:	45 31 ed             	xor    %r13d,%r13d
		errno = ENOMEM; 
 1fb:	c7 00 0c 00 00 00    	movl   $0xc,(%rax)
	return t;
 201:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
 206:	f3 0f 7e 44 24 08    	movq   0x8(%rsp),%xmm0
}
 20c:	4c 89 e0             	mov    %r12,%rax
	return t;
 20f:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
 214:	45 89 6c 24 10       	mov    %r13d,0x10(%r12)
 219:	45 89 6c 24 14       	mov    %r13d,0x14(%r12)
 21e:	0f 16 44 24 08       	movhps 0x8(%rsp),%xmm0
 223:	45 89 74 24 18       	mov    %r14d,0x18(%r12)
 228:	41 0f 11 04 24       	movups %xmm0,(%r12)
}
 22d:	48 83 c4 10          	add    $0x10,%rsp
 231:	5b                   	pop    %rbx
 232:	5d                   	pop    %rbp
 233:	41 5c                	pop    %r12
 235:	41 5d                	pop    %r13
 237:	41 5e                	pop    %r14
 239:	c3                   	retq   
 23a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000240 <fill_code_map>:
void fill_code_map (hcode_ctx_t t, getc_fn getc) {
 240:	55                   	push   %rbp
 241:	53                   	push   %rbx
 242:	48 83 ec 08          	sub    $0x8,%rsp
 246:	48 8b 6c 24 20       	mov    0x20(%rsp),%rbp
	if (!t.code_map || !t.char_map)
 24b:	48 85 ed             	test   %rbp,%rbp
 24e:	74 2a                	je     27a <fill_code_map+0x3a>
 250:	48 83 7c 24 28 00    	cmpq   $0x0,0x28(%rsp)
 256:	48 89 fb             	mov    %rdi,%rbx
 259:	75 16                	jne    271 <fill_code_map+0x31>
 25b:	eb 1d                	jmp    27a <fill_code_map+0x3a>
 25d:	0f 1f 00             	nopl   (%rax)
		t.code_map[c % t.charset_len].freq++;	
 260:	99                   	cltd   
 261:	f7 7c 24 30          	idivl  0x30(%rsp)
 265:	48 63 d2             	movslq %edx,%rdx
 268:	48 c1 e2 04          	shl    $0x4,%rdx
 26c:	83 44 15 00 01       	addl   $0x1,0x0(%rbp,%rdx,1)
	int c; while ((c = getc()) != -1) 
 271:	31 c0                	xor    %eax,%eax
 273:	ff d3                	callq  *%rbx
 275:	83 f8 ff             	cmp    $0xffffffff,%eax
 278:	75 e6                	jne    260 <fill_code_map+0x20>
}
 27a:	48 83 c4 08          	add    $0x8,%rsp
 27e:	5b                   	pop    %rbx
 27f:	5d                   	pop    %rbp
 280:	c3                   	retq   
 281:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
 288:	00 00 00 00 
 28c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000290 <prune_hcode_ctx>:
void prune_hcode_ctx (hcode_ctx_t t) {
 290:	8b 54 24 1c          	mov    0x1c(%rsp),%edx
 294:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
		int f = t.code_map[t.char_map[i]].freq;
 299:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
	while (++i < t.n_chars) {
 29e:	85 d2                	test   %edx,%edx
 2a0:	7e 39                	jle    2db <prune_hcode_ctx+0x4b>
 2a2:	83 ea 01             	sub    $0x1,%edx
 2a5:	4c 89 d0             	mov    %r10,%rax
	int i = -1, p = 0;
 2a8:	31 f6                	xor    %esi,%esi
 2aa:	4d 8d 4c 92 04       	lea    0x4(%r10,%rdx,4),%r9
 2af:	90                   	nop
		int f = t.code_map[t.char_map[i]].freq;
 2b0:	48 63 10             	movslq (%rax),%rdx
 2b3:	48 89 d1             	mov    %rdx,%rcx
 2b6:	48 c1 e2 04          	shl    $0x4,%rdx
		if (f > 0) swap(t.char_map, i, p++);
 2ba:	41 8b 14 10          	mov    (%r8,%rdx,1),%edx
 2be:	85 d2                	test   %edx,%edx
 2c0:	7e 10                	jle    2d2 <prune_hcode_ctx+0x42>
 2c2:	48 63 d6             	movslq %esi,%rdx
 2c5:	83 c6 01             	add    $0x1,%esi
 2c8:	49 8d 14 92          	lea    (%r10,%rdx,4),%rdx
 2cc:	8b 3a                	mov    (%rdx),%edi
 2ce:	89 38                	mov    %edi,(%rax)
 2d0:	89 0a                	mov    %ecx,(%rdx)
 2d2:	48 83 c0 04          	add    $0x4,%rax
	while (++i < t.n_chars) {
 2d6:	4c 39 c8             	cmp    %r9,%rax
 2d9:	75 d5                	jne    2b0 <prune_hcode_ctx+0x20>
}
 2db:	c3                   	retq   
 2dc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000002e0 <gen_huffman_tree>:
hcode_t * gen_huffman_tree (hcode_ctx_t t) {
 2e0:	41 55                	push   %r13
 2e2:	41 54                	push   %r12
 2e4:	55                   	push   %rbp
 2e5:	53                   	push   %rbx
 2e6:	48 83 ec 38          	sub    $0x38,%rsp
	heap_ctx_t heap_ctx = (heap_ctx_t) { .size = t.n_chars, 
 2ea:	48 8b 44 24 74       	mov    0x74(%rsp),%rax
 2ef:	48 8d 4c 24 60       	lea    0x60(%rsp),%rcx
	build_heap (t.char_map, heap_ctx);
 2f4:	48 83 ec 08          	sub    $0x8,%rsp
	heap_ctx_t heap_ctx = (heap_ctx_t) { .size = t.n_chars, 
 2f8:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
 2fd:	48 8d 0d fc fc ff ff 	lea    -0x304(%rip),%rcx        # 0 <compare_char_greater_than_in_freq>
 304:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
 309:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
	build_heap (t.char_map, heap_ctx);
 30e:	ff 74 24 28          	pushq  0x28(%rsp)
 312:	ff 74 24 28          	pushq  0x28(%rsp)
 316:	50                   	push   %rax
 317:	48 8b bc 24 88 00 00 	mov    0x88(%rsp),%rdi
 31e:	00 
 31f:	e8 00 00 00 00       	callq  324 <gen_huffman_tree+0x44>
	int c = N_CHAR_SET, i = t.n_chars;
 324:	8b 84 24 94 00 00 00 	mov    0x94(%rsp),%eax
	while (--i > 0) {
 32b:	48 83 c4 20          	add    $0x20,%rsp
 32f:	83 f8 01             	cmp    $0x1,%eax
 332:	0f 8e 13 01 00 00    	jle    44b <gen_huffman_tree+0x16b>
 338:	44 8d 60 fe          	lea    -0x2(%rax),%r12d
 33c:	31 db                	xor    %ebx,%ebx
 33e:	e9 d5 00 00 00       	jmpq   418 <gen_huffman_tree+0x138>
 343:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
		if (l) r = extract (heap_ctx, t.char_map);
 348:	48 83 ec 08          	sub    $0x8,%rsp
 34c:	ff 74 24 28          	pushq  0x28(%rsp)
 350:	ff 74 24 28          	pushq  0x28(%rsp)
 354:	ff 74 24 28          	pushq  0x28(%rsp)
 358:	48 8b bc 24 88 00 00 	mov    0x88(%rsp),%rdi
 35f:	00 
 360:	e8 00 00 00 00       	callq  365 <gen_huffman_tree+0x85>
		if (!r) { root = l; break; }
 365:	48 83 c4 20          	add    $0x20,%rsp
 369:	48 85 c0             	test   %rax,%rax
 36c:	0f 84 d9 00 00 00    	je     44b <gen_huffman_tree+0x16b>
		hcode_t lc = t.code_map[*l], rc = t.code_map[*r];
 372:	49 63 55 00          	movslq 0x0(%r13),%rdx
 376:	48 63 00             	movslq (%rax),%rax
 379:	48 8b 74 24 60       	mov    0x60(%rsp),%rsi
 37e:	48 89 d7             	mov    %rdx,%rdi
 381:	48 89 c1             	mov    %rax,%rcx
 384:	48 c1 e2 04          	shl    $0x4,%rdx
 388:	48 c1 e0 04          	shl    $0x4,%rax
 38c:	48 01 f2             	add    %rsi,%rdx
		t.code_map[c] = (hcode_t) { .lchild = *l, .rchild = *r, 
 38f:	89 4c 24 0c          	mov    %ecx,0xc(%rsp)
 393:	66 0f 6e 4c 24 0c    	movd   0xc(%rsp),%xmm1
		hcode_t lc = t.code_map[*l], rc = t.code_map[*r];
 399:	48 01 f0             	add    %rsi,%rax
			.freq = lc.freq + rc.freq, 
 39c:	44 8b 00             	mov    (%rax),%r8d
			.height = _max(lc.height, rc.height) + 1 };
 39f:	8b 40 0c             	mov    0xc(%rax),%eax
			.freq = lc.freq + rc.freq, 
 3a2:	44 03 02             	add    (%rdx),%r8d
			.height = _max(lc.height, rc.height) + 1 };
 3a5:	39 42 0c             	cmp    %eax,0xc(%rdx)
 3a8:	0f 4d 42 0c          	cmovge 0xc(%rdx),%eax
			.freq = lc.freq + rc.freq, 
 3ac:	44 89 44 24 04       	mov    %r8d,0x4(%rsp)
		insert (heap_ctx, t.char_map, c++);
 3b1:	48 83 ec 08          	sub    $0x8,%rsp
		t.code_map[c] = (hcode_t) { .lchild = *l, .rchild = *r, 
 3b5:	66 0f 6e 44 24 0c    	movd   0xc(%rsp),%xmm0
 3bb:	89 7c 24 0c          	mov    %edi,0xc(%rsp)
			.height = _max(lc.height, rc.height) + 1 };
 3bf:	83 c0 01             	add    $0x1,%eax
		t.code_map[c] = (hcode_t) { .lchild = *l, .rchild = *r, 
 3c2:	66 0f 6e 5c 24 0c    	movd   0xc(%rsp),%xmm3
			.height = _max(lc.height, rc.height) + 1 };
 3c8:	89 44 24 10          	mov    %eax,0x10(%rsp)
		t.code_map[c] = (hcode_t) { .lchild = *l, .rchild = *r, 
 3cc:	66 0f 6e 54 24 10    	movd   0x10(%rsp),%xmm2
 3d2:	48 89 d8             	mov    %rbx,%rax
 3d5:	66 0f 62 c3          	punpckldq %xmm3,%xmm0
 3d9:	48 c1 e0 04          	shl    $0x4,%rax
 3dd:	66 0f 62 ca          	punpckldq %xmm2,%xmm1
 3e1:	66 0f 6c c1          	punpcklqdq %xmm1,%xmm0
 3e5:	0f 11 84 06 00 10 00 	movups %xmm0,0x1000(%rsi,%rax,1)
 3ec:	00 
		insert (heap_ctx, t.char_map, c++);
 3ed:	89 ee                	mov    %ebp,%esi
 3ef:	ff 74 24 28          	pushq  0x28(%rsp)
 3f3:	ff 74 24 28          	pushq  0x28(%rsp)
 3f7:	ff 74 24 28          	pushq  0x28(%rsp)
 3fb:	48 8b bc 24 88 00 00 	mov    0x88(%rsp),%rdi
 402:	00 
 403:	e8 00 00 00 00       	callq  408 <gen_huffman_tree+0x128>
 408:	48 8d 43 01          	lea    0x1(%rbx),%rax
	while (--i > 0) {
 40c:	48 83 c4 20          	add    $0x20,%rsp
 410:	4c 39 e3             	cmp    %r12,%rbx
 413:	74 36                	je     44b <gen_huffman_tree+0x16b>
 415:	48 89 c3             	mov    %rax,%rbx
		int *l = extract (heap_ctx, t.char_map), *r = NULL;
 418:	48 83 ec 08          	sub    $0x8,%rsp
 41c:	8d ab 00 01 00 00    	lea    0x100(%rbx),%ebp
 422:	ff 74 24 28          	pushq  0x28(%rsp)
 426:	ff 74 24 28          	pushq  0x28(%rsp)
 42a:	ff 74 24 28          	pushq  0x28(%rsp)
 42e:	48 8b bc 24 88 00 00 	mov    0x88(%rsp),%rdi
 435:	00 
 436:	e8 00 00 00 00       	callq  43b <gen_huffman_tree+0x15b>
		if (l) r = extract (heap_ctx, t.char_map);
 43b:	48 83 c4 20          	add    $0x20,%rsp
		int *l = extract (heap_ctx, t.char_map), *r = NULL;
 43f:	49 89 c5             	mov    %rax,%r13
		if (l) r = extract (heap_ctx, t.char_map);
 442:	48 85 c0             	test   %rax,%rax
 445:	0f 85 fd fe ff ff    	jne    348 <gen_huffman_tree+0x68>
	root = extract (heap_ctx, t.char_map);
 44b:	48 83 ec 08          	sub    $0x8,%rsp
 44f:	ff 74 24 28          	pushq  0x28(%rsp)
 453:	ff 74 24 28          	pushq  0x28(%rsp)
 457:	ff 74 24 28          	pushq  0x28(%rsp)
 45b:	48 8b bc 24 88 00 00 	mov    0x88(%rsp),%rdi
 462:	00 
 463:	e8 00 00 00 00       	callq  468 <gen_huffman_tree+0x188>
	return root? &t.code_map[*root]: NULL;
 468:	48 83 c4 20          	add    $0x20,%rsp
 46c:	48 85 c0             	test   %rax,%rax
 46f:	74 1f                	je     490 <gen_huffman_tree+0x1b0>
 471:	48 63 00             	movslq (%rax),%rax
 474:	48 c1 e0 04          	shl    $0x4,%rax
 478:	48 03 44 24 60       	add    0x60(%rsp),%rax
}
 47d:	48 83 c4 38          	add    $0x38,%rsp
 481:	5b                   	pop    %rbx
 482:	5d                   	pop    %rbp
 483:	41 5c                	pop    %r12
 485:	41 5d                	pop    %r13
 487:	c3                   	retq   
 488:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 48f:	00 
 490:	48 83 c4 38          	add    $0x38,%rsp
	return root? &t.code_map[*root]: NULL;
 494:	31 c0                	xor    %eax,%eax
}
 496:	5b                   	pop    %rbx
 497:	5d                   	pop    %rbp
 498:	41 5c                	pop    %r12
 49a:	41 5d                	pop    %r13
 49c:	c3                   	retq   
 49d:	0f 1f 00             	nopl   (%rax)

00000000000004a0 <gen_code_map>:
}

hcode * gen_code_map (hcode_t *tree, hcode_ctx_t hc_ctx) {
 4a0:	41 55                	push   %r13
 4a2:	41 54                	push   %r12
 4a4:	49 89 fc             	mov    %rdi,%r12
 4a7:	55                   	push   %rbp
 4a8:	53                   	push   %rbx
 4a9:	48 83 ec 68          	sub    $0x68,%rsp
	_gen_hcode_ctx_t ctx;
	ctx.root = tree;

	int n_max_bits = tree->height;
 4ad:	8b 5f 0c             	mov    0xc(%rdi),%ebx
hcode * gen_code_map (hcode_t *tree, hcode_ctx_t hc_ctx) {
 4b0:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
 4b7:	00 00 
 4b9:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
 4be:	31 c0                	xor    %eax,%eax
	ctx.root = tree;
 4c0:	48 89 3c 24          	mov    %rdi,(%rsp)
	ctx.cap = n_max_bits + 1;
 4c4:	44 8d 6b 01          	lea    0x1(%rbx),%r13d
	ctx.buffer = malloc (ctx.cap);
 4c8:	49 63 fd             	movslq %r13d,%rdi
	ctx.cap = n_max_bits + 1;
 4cb:	44 89 6c 24 10       	mov    %r13d,0x10(%rsp)
	ctx.buffer = malloc (ctx.cap);
 4d0:	e8 00 00 00 00       	callq  4d5 <gen_code_map+0x35>
	
	int extra_byte = n_max_bits % 8 != 0;
 4d5:	31 ff                	xor    %edi,%edi
 4d7:	f6 c3 07             	test   $0x7,%bl
 4da:	40 0f 95 c7          	setne  %dil
	ctx.n_bytes = (n_max_bits >> 3) + extra_byte;
 4de:	c1 fb 03             	sar    $0x3,%ebx
	ctx.buffer = malloc (ctx.cap);
 4e1:	48 89 c5             	mov    %rax,%rbp
 4e4:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
	ctx.n_bytes = (n_max_bits >> 3) + extra_byte;
 4e9:	01 df                	add    %ebx,%edi
 4eb:	89 7c 24 20          	mov    %edi,0x20(%rsp)
	ctx.b_buf = malloc (ctx.n_bytes);
 4ef:	48 63 ff             	movslq %edi,%rdi
 4f2:	e8 00 00 00 00       	callq  4f7 <gen_code_map+0x57>

	ctx.hc_ctx = hc_ctx;

	ctx.map = malloc (hc_ctx.charset_len * sizeof (hcode));
 4f7:	48 63 bc 24 a0 00 00 	movslq 0xa0(%rsp),%rdi
 4fe:	00 
	ctx.hc_ctx = hc_ctx;
 4ff:	f3 0f 6f 84 24 90 00 	movdqu 0x90(%rsp),%xmm0
 506:	00 00 
 508:	f3 0f 6f 8c 24 a0 00 	movdqu 0xa0(%rsp),%xmm1
 50f:	00 00 
	ctx.b_buf = malloc (ctx.n_bytes);
 511:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
	ctx.map = malloc (hc_ctx.charset_len * sizeof (hcode));
 516:	48 c1 e7 04          	shl    $0x4,%rdi
	ctx.hc_ctx = hc_ctx;
 51a:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
 51f:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
	ctx.map = malloc (hc_ctx.charset_len * sizeof (hcode));
 524:	e8 00 00 00 00       	callq  529 <gen_code_map+0x89>
 529:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
	if (p - ctx->buffer >= ctx->cap) return;
 52e:	45 85 ed             	test   %r13d,%r13d
 531:	7e 19                	jle    54c <gen_code_map+0xac>
	int l = tree->lchild;
 533:	41 8b 54 24 04       	mov    0x4(%r12),%edx
	int r = tree->rchild;
 538:	41 8b 5c 24 08       	mov    0x8(%r12),%ebx
	if (l != -1) _get_hcode (ctx, 0, l, p);
 53d:	83 fa ff             	cmp    $0xffffffff,%edx
 540:	75 46                	jne    588 <gen_code_map+0xe8>
	if (r != -1) _get_hcode (ctx, 1, r, p);
 542:	83 fb ff             	cmp    $0xffffffff,%ebx
 545:	75 29                	jne    570 <gen_code_map+0xd0>
 547:	48 8b 44 24 28       	mov    0x28(%rsp),%rax

	_gen_hcode_map (&ctx, tree, ctx.buffer);

	return ctx.map;
}
 54c:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
 551:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
 558:	00 00 
 55a:	75 40                	jne    59c <gen_code_map+0xfc>
 55c:	48 83 c4 68          	add    $0x68,%rsp
 560:	5b                   	pop    %rbx
 561:	5d                   	pop    %rbp
 562:	41 5c                	pop    %r12
 564:	41 5d                	pop    %r13
 566:	c3                   	retq   
 567:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
 56e:	00 00 
	if (r != -1) _get_hcode (ctx, 1, r, p);
 570:	48 89 e7             	mov    %rsp,%rdi
 573:	48 89 e9             	mov    %rbp,%rcx
 576:	89 da                	mov    %ebx,%edx
 578:	be 01 00 00 00       	mov    $0x1,%esi
 57d:	e8 ae fa ff ff       	callq  30 <_get_hcode>
 582:	eb c3                	jmp    547 <gen_code_map+0xa7>
 584:	0f 1f 40 00          	nopl   0x0(%rax)
	if (l != -1) _get_hcode (ctx, 0, l, p);
 588:	31 f6                	xor    %esi,%esi
 58a:	48 89 e7             	mov    %rsp,%rdi
 58d:	48 89 e9             	mov    %rbp,%rcx
 590:	e8 9b fa ff ff       	callq  30 <_get_hcode>
	if (r != -1) _get_hcode (ctx, 1, r, p);
 595:	83 fb ff             	cmp    $0xffffffff,%ebx
 598:	74 ad                	je     547 <gen_code_map+0xa7>
 59a:	eb d4                	jmp    570 <gen_code_map+0xd0>
}
 59c:	e8 00 00 00 00       	callq  5a1 <gen_code_map+0x101>
