
lcs.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <allocate>:
#include <stdlib.h>
#include <stdio.h>

#include "lcs.h"

lcs_matrix_t allocate (int rows, int cols) {
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	41 55                	push   %r13
   6:	41 54                	push   %r12
   8:	53                   	push   %rbx
   9:	48 83 ec 28          	sub    $0x28,%rsp
   d:	89 7d cc             	mov    %edi,-0x34(%rbp)
  10:	89 75 c8             	mov    %esi,-0x38(%rbp)
	lcs_matrix_cell_t **m = malloc(rows * sizeof(lcs_matrix_cell_t *));
  13:	8b 45 cc             	mov    -0x34(%rbp),%eax
  16:	48 98                	cltq   
  18:	48 c1 e0 03          	shl    $0x3,%rax
  1c:	48 89 c7             	mov    %rax,%rdi
  1f:	e8 00 00 00 00       	callq  24 <allocate+0x24>
  24:	48 89 45 d8          	mov    %rax,-0x28(%rbp)

	if(!m) { errno = ENOMEM; m = NULL; }
  28:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  2d:	75 13                	jne    42 <allocate+0x42>
  2f:	e8 00 00 00 00       	callq  34 <allocate+0x34>
  34:	c7 00 0c 00 00 00    	movl   $0xc,(%rax)
  3a:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
  41:	00 

	int i; 

	for (i = 0; m && i < rows; i++) {
  42:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%rbp)
  49:	e9 9f 00 00 00       	jmpq   ed <allocate+0xed>
		m[i] = malloc(cols * sizeof(lcs_matrix_cell_t));
  4e:	8b 45 c8             	mov    -0x38(%rbp),%eax
  51:	48 98                	cltq   
  53:	48 c1 e0 03          	shl    $0x3,%rax
  57:	8b 55 d0             	mov    -0x30(%rbp),%edx
  5a:	48 63 d2             	movslq %edx,%rdx
  5d:	48 8d 0c d5 00 00 00 	lea    0x0(,%rdx,8),%rcx
  64:	00 
  65:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  69:	48 8d 1c 11          	lea    (%rcx,%rdx,1),%rbx
  6d:	48 89 c7             	mov    %rax,%rdi
  70:	e8 00 00 00 00       	callq  75 <allocate+0x75>
  75:	48 89 03             	mov    %rax,(%rbx)
		
		if (!m[i]) { errno = ENOMEM; break; }
  78:	8b 45 d0             	mov    -0x30(%rbp),%eax
  7b:	48 98                	cltq   
  7d:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  84:	00 
  85:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  89:	48 01 d0             	add    %rdx,%rax
  8c:	48 8b 00             	mov    (%rax),%rax
  8f:	48 85 c0             	test   %rax,%rax
  92:	75 0d                	jne    a1 <allocate+0xa1>
  94:	e8 00 00 00 00       	callq  99 <allocate+0x99>
  99:	c7 00 0c 00 00 00    	movl   $0xc,(%rax)
  9f:	eb 5f                	jmp    100 <allocate+0x100>
		
		for (int j = 0; j < cols; j++) 
  a1:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  a8:	eb 37                	jmp    e1 <allocate+0xe1>
			m[i][j] = (lcs_matrix_cell_t){0, 0};
  aa:	8b 45 d0             	mov    -0x30(%rbp),%eax
  ad:	48 98                	cltq   
  af:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  b6:	00 
  b7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  bb:	48 01 d0             	add    %rdx,%rax
  be:	48 8b 00             	mov    (%rax),%rax
  c1:	8b 55 d4             	mov    -0x2c(%rbp),%edx
  c4:	48 63 d2             	movslq %edx,%rdx
  c7:	48 c1 e2 03          	shl    $0x3,%rdx
  cb:	48 01 d0             	add    %rdx,%rax
  ce:	0f b6 10             	movzbl (%rax),%edx
  d1:	83 e2 fc             	and    $0xfffffffc,%edx
  d4:	88 10                	mov    %dl,(%rax)
  d6:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
		for (int j = 0; j < cols; j++) 
  dd:	83 45 d4 01          	addl   $0x1,-0x2c(%rbp)
  e1:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  e4:	3b 45 c8             	cmp    -0x38(%rbp),%eax
  e7:	7c c1                	jl     aa <allocate+0xaa>
	for (i = 0; m && i < rows; i++) {
  e9:	83 45 d0 01          	addl   $0x1,-0x30(%rbp)
  ed:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  f2:	74 0c                	je     100 <allocate+0x100>
  f4:	8b 45 d0             	mov    -0x30(%rbp),%eax
  f7:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  fa:	0f 8c 4e ff ff ff    	jl     4e <allocate+0x4e>
		
	}

	if (errno == ENOMEM) {
 100:	e8 00 00 00 00       	callq  105 <allocate+0x105>
 105:	8b 00                	mov    (%rax),%eax
 107:	83 f8 0c             	cmp    $0xc,%eax
 10a:	75 42                	jne    14e <allocate+0x14e>
		while(i) 
 10c:	eb 25                	jmp    133 <allocate+0x133>
			free(m[i--]);
 10e:	8b 45 d0             	mov    -0x30(%rbp),%eax
 111:	8d 50 ff             	lea    -0x1(%rax),%edx
 114:	89 55 d0             	mov    %edx,-0x30(%rbp)
 117:	48 98                	cltq   
 119:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
 120:	00 
 121:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 125:	48 01 d0             	add    %rdx,%rax
 128:	48 8b 00             	mov    (%rax),%rax
 12b:	48 89 c7             	mov    %rax,%rdi
 12e:	e8 00 00 00 00       	callq  133 <allocate+0x133>
		while(i) 
 133:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
 137:	75 d5                	jne    10e <allocate+0x10e>
		
		m = NULL;
 139:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
 140:	00 
		rows = cols = 0;
 141:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%rbp)
 148:	8b 45 c8             	mov    -0x38(%rbp),%eax
 14b:	89 45 cc             	mov    %eax,-0x34(%rbp)
	}

	return (lcs_matrix_t) {.m = m, .rows = rows, .cols = cols};
 14e:	8b 45 cc             	mov    -0x34(%rbp),%eax
 151:	8b 55 c8             	mov    -0x38(%rbp),%edx
 154:	4c 8b 65 d8          	mov    -0x28(%rbp),%r12
 158:	89 c1                	mov    %eax,%ecx
 15a:	4c 89 ee             	mov    %r13,%rsi
 15d:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
 164:	ff ff ff 
 167:	48 21 f0             	and    %rsi,%rax
 16a:	48 09 c8             	or     %rcx,%rax
 16d:	49 89 c5             	mov    %rax,%r13
 170:	89 d0                	mov    %edx,%eax
 172:	48 c1 e0 20          	shl    $0x20,%rax
 176:	4c 89 ea             	mov    %r13,%rdx
 179:	89 d2                	mov    %edx,%edx
 17b:	48 09 d0             	or     %rdx,%rax
 17e:	49 89 c5             	mov    %rax,%r13
 181:	4c 89 e0             	mov    %r12,%rax
 184:	4c 89 ea             	mov    %r13,%rdx
}
 187:	48 83 c4 28          	add    $0x28,%rsp
 18b:	5b                   	pop    %rbx
 18c:	41 5c                	pop    %r12
 18e:	41 5d                	pop    %r13
 190:	5d                   	pop    %rbp
 191:	c3                   	retq   

0000000000000192 <deallocate>:

void deallocate (lcs_matrix_t m) {
 192:	55                   	push   %rbp
 193:	48 89 e5             	mov    %rsp,%rbp
 196:	48 83 ec 10          	sub    $0x10,%rsp
 19a:	48 89 f8             	mov    %rdi,%rax
 19d:	48 89 f1             	mov    %rsi,%rcx
 1a0:	48 89 ca             	mov    %rcx,%rdx
 1a3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
 1a7:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
	while(m.rows) 
 1ab:	eb 24                	jmp    1d1 <deallocate+0x3f>
		free(m.m[--m.rows]); 
 1ad:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 1b1:	8b 55 f8             	mov    -0x8(%rbp),%edx
 1b4:	83 ea 01             	sub    $0x1,%edx
 1b7:	89 55 f8             	mov    %edx,-0x8(%rbp)
 1ba:	8b 55 f8             	mov    -0x8(%rbp),%edx
 1bd:	89 d2                	mov    %edx,%edx
 1bf:	48 c1 e2 03          	shl    $0x3,%rdx
 1c3:	48 01 d0             	add    %rdx,%rax
 1c6:	48 8b 00             	mov    (%rax),%rax
 1c9:	48 89 c7             	mov    %rax,%rdi
 1cc:	e8 00 00 00 00       	callq  1d1 <deallocate+0x3f>
	while(m.rows) 
 1d1:	8b 45 f8             	mov    -0x8(%rbp),%eax
 1d4:	85 c0                	test   %eax,%eax
 1d6:	75 d5                	jne    1ad <deallocate+0x1b>
	
	free(m.m); m.cols = 0;
 1d8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 1dc:	48 89 c7             	mov    %rax,%rdi
 1df:	e8 00 00 00 00       	callq  1e4 <deallocate+0x52>
 1e4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
}
 1eb:	90                   	nop
 1ec:	c9                   	leaveq 
 1ed:	c3                   	retq   

00000000000001ee <write_lcs_matrix>:

void write_lcs_matrix(lcs_matrix_t m, write_cell_fn fn, write_line_sep_fn sep_fn) {
 1ee:	55                   	push   %rbp
 1ef:	48 89 e5             	mov    %rsp,%rbp
 1f2:	48 83 ec 30          	sub    $0x30,%rsp
 1f6:	49 89 f8             	mov    %rdi,%r8
 1f9:	48 89 f0             	mov    %rsi,%rax
 1fc:	4c 89 c6             	mov    %r8,%rsi
 1ff:	4c 89 cf             	mov    %r9,%rdi
 202:	48 89 c7             	mov    %rax,%rdi
 205:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
 209:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
 20d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
 211:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
	for (int i = 0; i < m.rows; i++) {
 215:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
 21c:	eb 50                	jmp    26e <write_lcs_matrix+0x80>
		for (int j = 0; j < m.cols; j++) {
 21e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
 225:	eb 2e                	jmp    255 <write_lcs_matrix+0x67>
			fn(m.m[i][j]);
 227:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 22b:	8b 55 f8             	mov    -0x8(%rbp),%edx
 22e:	48 63 d2             	movslq %edx,%rdx
 231:	48 c1 e2 03          	shl    $0x3,%rdx
 235:	48 01 d0             	add    %rdx,%rax
 238:	48 8b 00             	mov    (%rax),%rax
 23b:	8b 55 fc             	mov    -0x4(%rbp),%edx
 23e:	48 63 d2             	movslq %edx,%rdx
 241:	48 c1 e2 03          	shl    $0x3,%rdx
 245:	48 01 c2             	add    %rax,%rdx
 248:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 24c:	48 8b 3a             	mov    (%rdx),%rdi
 24f:	ff d0                	callq  *%rax
		for (int j = 0; j < m.cols; j++) {
 251:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
 255:	8b 55 ec             	mov    -0x14(%rbp),%edx
 258:	8b 45 fc             	mov    -0x4(%rbp),%eax
 25b:	39 c2                	cmp    %eax,%edx
 25d:	77 c8                	ja     227 <write_lcs_matrix+0x39>
		}

		sep_fn();
 25f:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
 263:	b8 00 00 00 00       	mov    $0x0,%eax
 268:	ff d2                	callq  *%rdx
	for (int i = 0; i < m.rows; i++) {
 26a:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
 26e:	8b 55 e8             	mov    -0x18(%rbp),%edx
 271:	8b 45 f8             	mov    -0x8(%rbp),%eax
 274:	39 c2                	cmp    %eax,%edx
 276:	77 a6                	ja     21e <write_lcs_matrix+0x30>
	}
}
 278:	90                   	nop
 279:	c9                   	leaveq 
 27a:	c3                   	retq   

000000000000027b <std_write_cell_fn>:

void std_write_cell_fn (lcs_matrix_cell_t cell) {
 27b:	55                   	push   %rbp
 27c:	48 89 e5             	mov    %rsp,%rbp
 27f:	48 83 ec 20          	sub    $0x20,%rsp
 283:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
 287:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
 28e:	00 00 
 290:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 294:	31 c0                	xor    %eax,%eax
	char dir[] = {'^', '<', '`'};
 296:	c6 45 f5 5e          	movb   $0x5e,-0xb(%rbp)
 29a:	c6 45 f6 3c          	movb   $0x3c,-0xa(%rbp)
 29e:	c6 45 f7 60          	movb   $0x60,-0x9(%rbp)
	
	printf("%3d%c", cell.val, dir[cell.dir]);
 2a2:	0f b6 45 e8          	movzbl -0x18(%rbp),%eax
 2a6:	83 e0 03             	and    $0x3,%eax
 2a9:	0f b6 c0             	movzbl %al,%eax
 2ac:	48 98                	cltq   
 2ae:	0f b6 44 05 f5       	movzbl -0xb(%rbp,%rax,1),%eax
 2b3:	0f be d0             	movsbl %al,%edx
 2b6:	8b 45 ec             	mov    -0x14(%rbp),%eax
 2b9:	89 c6                	mov    %eax,%esi
 2bb:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 2c2 <std_write_cell_fn+0x47>
 2c2:	b8 00 00 00 00       	mov    $0x0,%eax
 2c7:	e8 00 00 00 00       	callq  2cc <std_write_cell_fn+0x51>
} 
 2cc:	90                   	nop
 2cd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 2d1:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
 2d8:	00 00 
 2da:	74 05                	je     2e1 <std_write_cell_fn+0x66>
 2dc:	e8 00 00 00 00       	callq  2e1 <std_write_cell_fn+0x66>
 2e1:	c9                   	leaveq 
 2e2:	c3                   	retq   

00000000000002e3 <std_write_line_sep_fn>:

void std_write_line_sep_fn () { printf("\n"); }
 2e3:	55                   	push   %rbp
 2e4:	48 89 e5             	mov    %rsp,%rbp
 2e7:	bf 0a 00 00 00       	mov    $0xa,%edi
 2ec:	e8 00 00 00 00       	callq  2f1 <std_write_line_sep_fn+0xe>
 2f1:	90                   	nop
 2f2:	5d                   	pop    %rbp
 2f3:	c3                   	retq   

00000000000002f4 <generate_lcs_matrix>:

lcs_matrix_t generate_lcs_matrix (string_t X, string_t Y) {
 2f4:	55                   	push   %rbp
 2f5:	48 89 e5             	mov    %rsp,%rbp
 2f8:	48 83 ec 40          	sub    $0x40,%rsp
 2fc:	41 89 f8             	mov    %edi,%r8d
 2ff:	48 89 f0             	mov    %rsi,%rax
 302:	4c 89 c6             	mov    %r8,%rsi
 305:	4c 89 cf             	mov    %r9,%rdi
 308:	48 89 c7             	mov    %rax,%rdi
 30b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
 30f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
 313:	89 d0                	mov    %edx,%eax
 315:	48 89 ca             	mov    %rcx,%rdx
 318:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
 31c:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
	lcs_matrix_t M = allocate (X.length+1, Y.length+1);
 320:	8b 45 c0             	mov    -0x40(%rbp),%eax
 323:	83 c0 01             	add    $0x1,%eax
 326:	89 c2                	mov    %eax,%edx
 328:	8b 45 d0             	mov    -0x30(%rbp),%eax
 32b:	83 c0 01             	add    $0x1,%eax
 32e:	89 d6                	mov    %edx,%esi
 330:	89 c7                	mov    %eax,%edi
 332:	e8 00 00 00 00       	callq  337 <generate_lcs_matrix+0x43>
 337:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
 33b:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)

	for (int i = 1; i <= X.length; i++) {
 33f:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%rbp)
 346:	e9 b2 01 00 00       	jmpq   4fd <generate_lcs_matrix+0x209>
		for(int j = 1; j <= Y.length; j++) {
 34b:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%rbp)
 352:	e9 94 01 00 00       	jmpq   4eb <generate_lcs_matrix+0x1f7>
			
			if (X.string[i-1] == Y.string[j-1]) 
 357:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 35b:	8b 55 e8             	mov    -0x18(%rbp),%edx
 35e:	48 63 d2             	movslq %edx,%rdx
 361:	48 83 ea 01          	sub    $0x1,%rdx
 365:	48 01 d0             	add    %rdx,%rax
 368:	0f b6 10             	movzbl (%rax),%edx
 36b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
 36f:	8b 4d ec             	mov    -0x14(%rbp),%ecx
 372:	48 63 c9             	movslq %ecx,%rcx
 375:	48 83 e9 01          	sub    $0x1,%rcx
 379:	48 01 c8             	add    %rcx,%rax
 37c:	0f b6 00             	movzbl (%rax),%eax
 37f:	38 c2                	cmp    %al,%dl
 381:	75 63                	jne    3e6 <generate_lcs_matrix+0xf2>
				M.m[i][j] = (lcs_matrix_cell_t) {
 383:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 387:	8b 55 e8             	mov    -0x18(%rbp),%edx
 38a:	48 63 d2             	movslq %edx,%rdx
 38d:	48 c1 e2 03          	shl    $0x3,%rdx
 391:	48 01 d0             	add    %rdx,%rax
 394:	48 8b 00             	mov    (%rax),%rax
 397:	8b 55 ec             	mov    -0x14(%rbp),%edx
 39a:	48 63 d2             	movslq %edx,%rdx
 39d:	48 c1 e2 03          	shl    $0x3,%rdx
 3a1:	48 01 d0             	add    %rdx,%rax
					.val = M.m[i-1][j-1].val+1, .dir = TOP_LEFT };
 3a4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
 3a8:	8b 4d e8             	mov    -0x18(%rbp),%ecx
 3ab:	48 63 c9             	movslq %ecx,%rcx
 3ae:	48 c1 e1 03          	shl    $0x3,%rcx
 3b2:	48 83 e9 08          	sub    $0x8,%rcx
 3b6:	48 01 ca             	add    %rcx,%rdx
 3b9:	48 8b 12             	mov    (%rdx),%rdx
 3bc:	8b 4d ec             	mov    -0x14(%rbp),%ecx
 3bf:	48 63 c9             	movslq %ecx,%rcx
 3c2:	48 c1 e1 03          	shl    $0x3,%rcx
 3c6:	48 83 e9 08          	sub    $0x8,%rcx
 3ca:	48 01 ca             	add    %rcx,%rdx
 3cd:	8b 52 04             	mov    0x4(%rdx),%edx
 3d0:	83 c2 01             	add    $0x1,%edx
				M.m[i][j] = (lcs_matrix_cell_t) {
 3d3:	0f b6 08             	movzbl (%rax),%ecx
 3d6:	83 e1 fc             	and    $0xfffffffc,%ecx
 3d9:	83 c9 02             	or     $0x2,%ecx
 3dc:	88 08                	mov    %cl,(%rax)
 3de:	89 50 04             	mov    %edx,0x4(%rax)
 3e1:	e9 01 01 00 00       	jmpq   4e7 <generate_lcs_matrix+0x1f3>
			
			else if (M.m[i-1][j].val >= M.m[i][j-1].val) 
 3e6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 3ea:	8b 55 e8             	mov    -0x18(%rbp),%edx
 3ed:	48 63 d2             	movslq %edx,%rdx
 3f0:	48 c1 e2 03          	shl    $0x3,%rdx
 3f4:	48 83 ea 08          	sub    $0x8,%rdx
 3f8:	48 01 d0             	add    %rdx,%rax
 3fb:	48 8b 00             	mov    (%rax),%rax
 3fe:	8b 55 ec             	mov    -0x14(%rbp),%edx
 401:	48 63 d2             	movslq %edx,%rdx
 404:	48 c1 e2 03          	shl    $0x3,%rdx
 408:	48 01 d0             	add    %rdx,%rax
 40b:	8b 50 04             	mov    0x4(%rax),%edx
 40e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 412:	8b 4d e8             	mov    -0x18(%rbp),%ecx
 415:	48 63 c9             	movslq %ecx,%rcx
 418:	48 c1 e1 03          	shl    $0x3,%rcx
 41c:	48 01 c8             	add    %rcx,%rax
 41f:	48 8b 00             	mov    (%rax),%rax
 422:	8b 4d ec             	mov    -0x14(%rbp),%ecx
 425:	48 63 c9             	movslq %ecx,%rcx
 428:	48 c1 e1 03          	shl    $0x3,%rcx
 42c:	48 83 e9 08          	sub    $0x8,%rcx
 430:	48 01 c8             	add    %rcx,%rax
 433:	8b 40 04             	mov    0x4(%rax),%eax
 436:	39 c2                	cmp    %eax,%edx
 438:	72 56                	jb     490 <generate_lcs_matrix+0x19c>
				M.m[i][j] = (lcs_matrix_cell_t) {
 43a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 43e:	8b 55 e8             	mov    -0x18(%rbp),%edx
 441:	48 63 d2             	movslq %edx,%rdx
 444:	48 c1 e2 03          	shl    $0x3,%rdx
 448:	48 01 d0             	add    %rdx,%rax
 44b:	48 8b 00             	mov    (%rax),%rax
 44e:	8b 55 ec             	mov    -0x14(%rbp),%edx
 451:	48 63 d2             	movslq %edx,%rdx
 454:	48 c1 e2 03          	shl    $0x3,%rdx
 458:	48 01 d0             	add    %rdx,%rax
					.val = M.m[i-1][j].val, .dir = TOP };
 45b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
 45f:	8b 4d e8             	mov    -0x18(%rbp),%ecx
 462:	48 63 c9             	movslq %ecx,%rcx
 465:	48 c1 e1 03          	shl    $0x3,%rcx
 469:	48 83 e9 08          	sub    $0x8,%rcx
 46d:	48 01 ca             	add    %rcx,%rdx
 470:	48 8b 12             	mov    (%rdx),%rdx
 473:	8b 4d ec             	mov    -0x14(%rbp),%ecx
 476:	48 63 c9             	movslq %ecx,%rcx
 479:	48 c1 e1 03          	shl    $0x3,%rcx
 47d:	48 01 ca             	add    %rcx,%rdx
 480:	8b 52 04             	mov    0x4(%rdx),%edx
				M.m[i][j] = (lcs_matrix_cell_t) {
 483:	0f b6 08             	movzbl (%rax),%ecx
 486:	83 e1 fc             	and    $0xfffffffc,%ecx
 489:	88 08                	mov    %cl,(%rax)
 48b:	89 50 04             	mov    %edx,0x4(%rax)
 48e:	eb 57                	jmp    4e7 <generate_lcs_matrix+0x1f3>

			else 
				M.m[i][j] = (lcs_matrix_cell_t) {
 490:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 494:	8b 55 e8             	mov    -0x18(%rbp),%edx
 497:	48 63 d2             	movslq %edx,%rdx
 49a:	48 c1 e2 03          	shl    $0x3,%rdx
 49e:	48 01 d0             	add    %rdx,%rax
 4a1:	48 8b 00             	mov    (%rax),%rax
 4a4:	8b 55 ec             	mov    -0x14(%rbp),%edx
 4a7:	48 63 d2             	movslq %edx,%rdx
 4aa:	48 c1 e2 03          	shl    $0x3,%rdx
 4ae:	48 01 d0             	add    %rdx,%rax
					.val = M.m[i][j-1].val, .dir = LEFT };
 4b1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
 4b5:	8b 4d e8             	mov    -0x18(%rbp),%ecx
 4b8:	48 63 c9             	movslq %ecx,%rcx
 4bb:	48 c1 e1 03          	shl    $0x3,%rcx
 4bf:	48 01 ca             	add    %rcx,%rdx
 4c2:	48 8b 12             	mov    (%rdx),%rdx
 4c5:	8b 4d ec             	mov    -0x14(%rbp),%ecx
 4c8:	48 63 c9             	movslq %ecx,%rcx
 4cb:	48 c1 e1 03          	shl    $0x3,%rcx
 4cf:	48 83 e9 08          	sub    $0x8,%rcx
 4d3:	48 01 ca             	add    %rcx,%rdx
 4d6:	8b 52 04             	mov    0x4(%rdx),%edx
				M.m[i][j] = (lcs_matrix_cell_t) {
 4d9:	0f b6 08             	movzbl (%rax),%ecx
 4dc:	83 e1 fc             	and    $0xfffffffc,%ecx
 4df:	83 c9 01             	or     $0x1,%ecx
 4e2:	88 08                	mov    %cl,(%rax)
 4e4:	89 50 04             	mov    %edx,0x4(%rax)
		for(int j = 1; j <= Y.length; j++) {
 4e7:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
 4eb:	8b 55 c0             	mov    -0x40(%rbp),%edx
 4ee:	8b 45 ec             	mov    -0x14(%rbp),%eax
 4f1:	39 c2                	cmp    %eax,%edx
 4f3:	0f 83 5e fe ff ff    	jae    357 <generate_lcs_matrix+0x63>
	for (int i = 1; i <= X.length; i++) {
 4f9:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
 4fd:	8b 55 d0             	mov    -0x30(%rbp),%edx
 500:	8b 45 e8             	mov    -0x18(%rbp),%eax
 503:	39 c2                	cmp    %eax,%edx
 505:	0f 83 40 fe ff ff    	jae    34b <generate_lcs_matrix+0x57>

		}
	
	}

	return M;
 50b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 50f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
}
 513:	c9                   	leaveq 
 514:	c3                   	retq   

0000000000000515 <get_lcs_string>:

string_t get_lcs_string (lcs_matrix_t M, string_t X, int i, int j) {
 515:	55                   	push   %rbp
 516:	48 89 e5             	mov    %rsp,%rbp
 519:	53                   	push   %rbx
 51a:	48 83 ec 68          	sub    $0x68,%rsp
 51e:	48 89 fb             	mov    %rdi,%rbx
 521:	48 89 f0             	mov    %rsi,%rax
 524:	48 89 f7             	mov    %rsi,%rdi
 527:	48 89 de             	mov    %rbx,%rsi
 52a:	48 89 c7             	mov    %rax,%rdi
 52d:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
 531:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
 535:	89 d0                	mov    %edx,%eax
 537:	48 89 ca             	mov    %rcx,%rdx
 53a:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
 53e:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
 542:	44 89 45 9c          	mov    %r8d,-0x64(%rbp)
 546:	44 89 4d 98          	mov    %r9d,-0x68(%rbp)
	if (!i || !j) 
 54a:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
 54e:	74 06                	je     556 <get_lcs_string+0x41>
 550:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
 554:	75 1e                	jne    574 <get_lcs_string+0x5f>
		return (string_t) {.string = NULL, .length = 0};
 556:	4c 89 d2             	mov    %r10,%rdx
 559:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
 560:	ff ff ff 
 563:	48 21 d0             	and    %rdx,%rax
 566:	49 89 c2             	mov    %rax,%r10
 569:	41 bb 00 00 00 00    	mov    $0x0,%r11d
 56f:	e9 3a 01 00 00       	jmpq   6ae <get_lcs_string+0x199>

	char *string = malloc( M.m[i][j].val + 1);
 574:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
 578:	8b 55 9c             	mov    -0x64(%rbp),%edx
 57b:	48 63 d2             	movslq %edx,%rdx
 57e:	48 c1 e2 03          	shl    $0x3,%rdx
 582:	48 01 d0             	add    %rdx,%rax
 585:	48 8b 00             	mov    (%rax),%rax
 588:	8b 55 98             	mov    -0x68(%rbp),%edx
 58b:	48 63 d2             	movslq %edx,%rdx
 58e:	48 c1 e2 03          	shl    $0x3,%rdx
 592:	48 01 d0             	add    %rdx,%rax
 595:	8b 40 04             	mov    0x4(%rax),%eax
 598:	83 c0 01             	add    $0x1,%eax
 59b:	89 c0                	mov    %eax,%eax
 59d:	48 89 c7             	mov    %rax,%rdi
 5a0:	e8 00 00 00 00       	callq  5a5 <get_lcs_string+0x90>
 5a5:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
	
	string_t str = (string_t) {
		.string = string, .length = M.m[i][j].val };
 5a9:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
 5ad:	8b 55 9c             	mov    -0x64(%rbp),%edx
 5b0:	48 63 d2             	movslq %edx,%rdx
 5b3:	48 c1 e2 03          	shl    $0x3,%rdx
 5b7:	48 01 d0             	add    %rdx,%rax
 5ba:	48 8b 00             	mov    (%rax),%rax
 5bd:	8b 55 98             	mov    -0x68(%rbp),%edx
 5c0:	48 63 d2             	movslq %edx,%rdx
 5c3:	48 c1 e2 03          	shl    $0x3,%rdx
 5c7:	48 01 d0             	add    %rdx,%rax
 5ca:	8b 40 04             	mov    0x4(%rax),%eax
	string_t str = (string_t) {
 5cd:	89 45 e0             	mov    %eax,-0x20(%rbp)
 5d0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 5d4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
	
	str.string[str.length] = 0; // '\0'
 5d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 5dc:	8b 55 e0             	mov    -0x20(%rbp),%edx
 5df:	89 d2                	mov    %edx,%edx
 5e1:	48 01 d0             	add    %rdx,%rax
 5e4:	c6 00 00             	movb   $0x0,(%rax)

	int p = str.length - 1;
 5e7:	8b 45 e0             	mov    -0x20(%rbp),%eax
 5ea:	83 e8 01             	sub    $0x1,%eax
 5ed:	89 45 cc             	mov    %eax,-0x34(%rbp)

	while (i != 0 && j != 0 && p >= 0) {
 5f0:	e9 9b 00 00 00       	jmpq   690 <get_lcs_string+0x17b>
		int di = 0, dj = 0;
 5f5:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%rbp)
 5fc:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)

		switch(M.m[i][j].dir) {
 603:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
 607:	8b 55 9c             	mov    -0x64(%rbp),%edx
 60a:	48 63 d2             	movslq %edx,%rdx
 60d:	48 c1 e2 03          	shl    $0x3,%rdx
 611:	48 01 d0             	add    %rdx,%rax
 614:	48 8b 00             	mov    (%rax),%rax
 617:	8b 55 98             	mov    -0x68(%rbp),%edx
 61a:	48 63 d2             	movslq %edx,%rdx
 61d:	48 c1 e2 03          	shl    $0x3,%rdx
 621:	48 01 d0             	add    %rdx,%rax
 624:	0f b6 00             	movzbl (%rax),%eax
 627:	83 e0 03             	and    $0x3,%eax
 62a:	0f b6 c0             	movzbl %al,%eax
 62d:	83 f8 01             	cmp    $0x1,%eax
 630:	74 12                	je     644 <get_lcs_string+0x12f>
 632:	83 f8 02             	cmp    $0x2,%eax
 635:	74 16                	je     64d <get_lcs_string+0x138>
 637:	85 c0                	test   %eax,%eax
 639:	75 49                	jne    684 <get_lcs_string+0x16f>
			case TOP:
				di = -1;
 63b:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%rbp)
				break;
 642:	eb 40                	jmp    684 <get_lcs_string+0x16f>
			case LEFT:
				dj = -1;
 644:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%rbp)
				break;
 64b:	eb 37                	jmp    684 <get_lcs_string+0x16f>
			case TOP_LEFT:
				di = dj = -1;
 64d:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%rbp)
 654:	8b 45 d4             	mov    -0x2c(%rbp),%eax
 657:	89 45 d0             	mov    %eax,-0x30(%rbp)
				str.string[p--] = X.string[i-1];
 65a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
 65e:	8b 55 9c             	mov    -0x64(%rbp),%edx
 661:	48 63 d2             	movslq %edx,%rdx
 664:	48 83 ea 01          	sub    $0x1,%rdx
 668:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
 66c:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
 670:	8b 45 cc             	mov    -0x34(%rbp),%eax
 673:	8d 50 ff             	lea    -0x1(%rax),%edx
 676:	89 55 cc             	mov    %edx,-0x34(%rbp)
 679:	48 98                	cltq   
 67b:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
 67f:	0f b6 01             	movzbl (%rcx),%eax
 682:	88 02                	mov    %al,(%rdx)
		}

		i += di; j += dj;
 684:	8b 45 d0             	mov    -0x30(%rbp),%eax
 687:	01 45 9c             	add    %eax,-0x64(%rbp)
 68a:	8b 45 d4             	mov    -0x2c(%rbp),%eax
 68d:	01 45 98             	add    %eax,-0x68(%rbp)
	while (i != 0 && j != 0 && p >= 0) {
 690:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
 694:	74 10                	je     6a6 <get_lcs_string+0x191>
 696:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
 69a:	74 0a                	je     6a6 <get_lcs_string+0x191>
 69c:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
 6a0:	0f 89 4f ff ff ff    	jns    5f5 <get_lcs_string+0xe0>
	}

	return str;
 6a6:	4c 8b 55 e0          	mov    -0x20(%rbp),%r10
 6aa:	4c 8b 5d e8          	mov    -0x18(%rbp),%r11
 6ae:	4c 89 d1             	mov    %r10,%rcx
 6b1:	4c 89 db             	mov    %r11,%rbx
 6b4:	4c 89 d0             	mov    %r10,%rax
 6b7:	4c 89 da             	mov    %r11,%rdx
} 
 6ba:	89 c8                	mov    %ecx,%eax
 6bc:	48 83 c4 68          	add    $0x68,%rsp
 6c0:	5b                   	pop    %rbx
 6c1:	5d                   	pop    %rbp
 6c2:	c3                   	retq   
