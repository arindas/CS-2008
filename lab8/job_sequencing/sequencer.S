
sequencer:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <__gmon_start__>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	callq  *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	retq   

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 e2 2f 00 00    	pushq  0x2fe2(%rip)        # 4008 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 e4 2f 00 00    	jmpq   *0x2fe4(%rip)        # 4010 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <free@plt>:
    1030:	ff 25 e2 2f 00 00    	jmpq   *0x2fe2(%rip)        # 4018 <free@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	pushq  $0x0
    103b:	e9 e0 ff ff ff       	jmpq   1020 <.plt>

0000000000001040 <__isoc99_fscanf@plt>:
    1040:	ff 25 da 2f 00 00    	jmpq   *0x2fda(%rip)        # 4020 <__isoc99_fscanf@GLIBC_2.7>
    1046:	68 01 00 00 00       	pushq  $0x1
    104b:	e9 d0 ff ff ff       	jmpq   1020 <.plt>

0000000000001050 <__stack_chk_fail@plt>:
    1050:	ff 25 d2 2f 00 00    	jmpq   *0x2fd2(%rip)        # 4028 <__stack_chk_fail@GLIBC_2.4>
    1056:	68 02 00 00 00       	pushq  $0x2
    105b:	e9 c0 ff ff ff       	jmpq   1020 <.plt>

0000000000001060 <printf@plt>:
    1060:	ff 25 ca 2f 00 00    	jmpq   *0x2fca(%rip)        # 4030 <printf@GLIBC_2.2.5>
    1066:	68 03 00 00 00       	pushq  $0x3
    106b:	e9 b0 ff ff ff       	jmpq   1020 <.plt>

0000000000001070 <memset@plt>:
    1070:	ff 25 c2 2f 00 00    	jmpq   *0x2fc2(%rip)        # 4038 <memset@GLIBC_2.2.5>
    1076:	68 04 00 00 00       	pushq  $0x4
    107b:	e9 a0 ff ff ff       	jmpq   1020 <.plt>

0000000000001080 <fprintf@plt>:
    1080:	ff 25 ba 2f 00 00    	jmpq   *0x2fba(%rip)        # 4040 <fprintf@GLIBC_2.2.5>
    1086:	68 05 00 00 00       	pushq  $0x5
    108b:	e9 90 ff ff ff       	jmpq   1020 <.plt>

0000000000001090 <malloc@plt>:
    1090:	ff 25 b2 2f 00 00    	jmpq   *0x2fb2(%rip)        # 4048 <malloc@GLIBC_2.2.5>
    1096:	68 06 00 00 00       	pushq  $0x6
    109b:	e9 80 ff ff ff       	jmpq   1020 <.plt>

00000000000010a0 <__isoc99_scanf@plt>:
    10a0:	ff 25 aa 2f 00 00    	jmpq   *0x2faa(%rip)        # 4050 <__isoc99_scanf@GLIBC_2.7>
    10a6:	68 07 00 00 00       	pushq  $0x7
    10ab:	e9 70 ff ff ff       	jmpq   1020 <.plt>

00000000000010b0 <fwrite@plt>:
    10b0:	ff 25 a2 2f 00 00    	jmpq   *0x2fa2(%rip)        # 4058 <fwrite@GLIBC_2.2.5>
    10b6:	68 08 00 00 00       	pushq  $0x8
    10bb:	e9 60 ff ff ff       	jmpq   1020 <.plt>

Disassembly of section .text:

00000000000010c0 <_start>:
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	31 ed                	xor    %ebp,%ebp
    10c6:	49 89 d1             	mov    %rdx,%r9
    10c9:	5e                   	pop    %rsi
    10ca:	48 89 e2             	mov    %rsp,%rdx
    10cd:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    10d1:	50                   	push   %rax
    10d2:	54                   	push   %rsp
    10d3:	4c 8d 05 26 08 00 00 	lea    0x826(%rip),%r8        # 1900 <__libc_csu_fini>
    10da:	48 8d 0d af 07 00 00 	lea    0x7af(%rip),%rcx        # 1890 <__libc_csu_init>
    10e1:	48 8d 3d 8a 06 00 00 	lea    0x68a(%rip),%rdi        # 1772 <main>
    10e8:	ff 15 f2 2e 00 00    	callq  *0x2ef2(%rip)        # 3fe0 <__libc_start_main@GLIBC_2.2.5>
    10ee:	f4                   	hlt    
    10ef:	90                   	nop

00000000000010f0 <deregister_tm_clones>:
    10f0:	48 8d 3d 79 2f 00 00 	lea    0x2f79(%rip),%rdi        # 4070 <stdout@@GLIBC_2.2.5>
    10f7:	48 8d 05 72 2f 00 00 	lea    0x2f72(%rip),%rax        # 4070 <stdout@@GLIBC_2.2.5>
    10fe:	48 39 f8             	cmp    %rdi,%rax
    1101:	74 15                	je     1118 <deregister_tm_clones+0x28>
    1103:	48 8b 05 ce 2e 00 00 	mov    0x2ece(%rip),%rax        # 3fd8 <_ITM_deregisterTMCloneTable>
    110a:	48 85 c0             	test   %rax,%rax
    110d:	74 09                	je     1118 <deregister_tm_clones+0x28>
    110f:	ff e0                	jmpq   *%rax
    1111:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1118:	c3                   	retq   
    1119:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001120 <register_tm_clones>:
    1120:	48 8d 3d 49 2f 00 00 	lea    0x2f49(%rip),%rdi        # 4070 <stdout@@GLIBC_2.2.5>
    1127:	48 8d 35 42 2f 00 00 	lea    0x2f42(%rip),%rsi        # 4070 <stdout@@GLIBC_2.2.5>
    112e:	48 29 fe             	sub    %rdi,%rsi
    1131:	48 c1 fe 03          	sar    $0x3,%rsi
    1135:	48 89 f0             	mov    %rsi,%rax
    1138:	48 c1 e8 3f          	shr    $0x3f,%rax
    113c:	48 01 c6             	add    %rax,%rsi
    113f:	48 d1 fe             	sar    %rsi
    1142:	74 14                	je     1158 <register_tm_clones+0x38>
    1144:	48 8b 05 a5 2e 00 00 	mov    0x2ea5(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable>
    114b:	48 85 c0             	test   %rax,%rax
    114e:	74 08                	je     1158 <register_tm_clones+0x38>
    1150:	ff e0                	jmpq   *%rax
    1152:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1158:	c3                   	retq   
    1159:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001160 <__do_global_dtors_aux>:
    1160:	f3 0f 1e fa          	endbr64 
    1164:	80 3d 1d 2f 00 00 00 	cmpb   $0x0,0x2f1d(%rip)        # 4088 <completed.7287>
    116b:	75 33                	jne    11a0 <__do_global_dtors_aux+0x40>
    116d:	55                   	push   %rbp
    116e:	48 83 3d 82 2e 00 00 	cmpq   $0x0,0x2e82(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1175:	00 
    1176:	48 89 e5             	mov    %rsp,%rbp
    1179:	74 0d                	je     1188 <__do_global_dtors_aux+0x28>
    117b:	48 8b 3d e6 2e 00 00 	mov    0x2ee6(%rip),%rdi        # 4068 <__dso_handle>
    1182:	ff 15 70 2e 00 00    	callq  *0x2e70(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1188:	e8 63 ff ff ff       	callq  10f0 <deregister_tm_clones>
    118d:	c6 05 f4 2e 00 00 01 	movb   $0x1,0x2ef4(%rip)        # 4088 <completed.7287>
    1194:	5d                   	pop    %rbp
    1195:	c3                   	retq   
    1196:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    119d:	00 00 00 
    11a0:	c3                   	retq   
    11a1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    11a8:	00 00 00 00 
    11ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000011b0 <frame_dummy>:
    11b0:	f3 0f 1e fa          	endbr64 
    11b4:	e9 67 ff ff ff       	jmpq   1120 <register_tm_clones>

00000000000011b9 <swap>:
#include <stdio.h>

typedef struct { int label, profit, deadline, time_taken; } job;

void swap (job *jobs, int i, int j) 
{ job temp = jobs[i]; jobs[i] = jobs[j]; jobs[j] = temp; }
    11b9:	55                   	push   %rbp
    11ba:	48 89 e5             	mov    %rsp,%rbp
    11bd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    11c1:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    11c4:	89 55 e0             	mov    %edx,-0x20(%rbp)
    11c7:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    11ca:	48 98                	cltq   
    11cc:	48 c1 e0 04          	shl    $0x4,%rax
    11d0:	48 89 c2             	mov    %rax,%rdx
    11d3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    11d7:	48 01 d0             	add    %rdx,%rax
    11da:	48 8b 50 08          	mov    0x8(%rax),%rdx
    11de:	48 8b 00             	mov    (%rax),%rax
    11e1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    11e5:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
    11e9:	8b 45 e0             	mov    -0x20(%rbp),%eax
    11ec:	48 98                	cltq   
    11ee:	48 c1 e0 04          	shl    $0x4,%rax
    11f2:	48 89 c2             	mov    %rax,%rdx
    11f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    11f9:	48 01 d0             	add    %rdx,%rax
    11fc:	8b 55 e4             	mov    -0x1c(%rbp),%edx
    11ff:	48 63 d2             	movslq %edx,%rdx
    1202:	48 89 d1             	mov    %rdx,%rcx
    1205:	48 c1 e1 04          	shl    $0x4,%rcx
    1209:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    120d:	48 01 d1             	add    %rdx,%rcx
    1210:	48 8b 50 08          	mov    0x8(%rax),%rdx
    1214:	48 8b 00             	mov    (%rax),%rax
    1217:	48 89 01             	mov    %rax,(%rcx)
    121a:	48 89 51 08          	mov    %rdx,0x8(%rcx)
    121e:	8b 45 e0             	mov    -0x20(%rbp),%eax
    1221:	48 98                	cltq   
    1223:	48 c1 e0 04          	shl    $0x4,%rax
    1227:	48 89 c2             	mov    %rax,%rdx
    122a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    122e:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
    1232:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1236:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    123a:	48 89 01             	mov    %rax,(%rcx)
    123d:	48 89 51 08          	mov    %rdx,0x8(%rcx)
    1241:	90                   	nop
    1242:	5d                   	pop    %rbp
    1243:	c3                   	retq   

0000000000001244 <sort_jobs>:

void sort_jobs (job *jobs, int start, int end, int *max_deadline) {
    1244:	55                   	push   %rbp
    1245:	48 89 e5             	mov    %rsp,%rbp
    1248:	48 83 ec 30          	sub    $0x30,%rsp
    124c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1250:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    1253:	89 55 e0             	mov    %edx,-0x20(%rbp)
    1256:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
	// if there are only zero or one jobs
	// it is already sorted
	if (start >= end)
    125a:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    125d:	3b 45 e0             	cmp    -0x20(%rbp),%eax
    1260:	0f 8d 12 01 00 00    	jge    1378 <sort_jobs+0x134>
		return;

	// set middle element as the pivot element
	int pivot = (start + end) / 2;
    1266:	8b 55 e4             	mov    -0x1c(%rbp),%edx
    1269:	8b 45 e0             	mov    -0x20(%rbp),%eax
    126c:	01 d0                	add    %edx,%eax
    126e:	89 c2                	mov    %eax,%edx
    1270:	c1 ea 1f             	shr    $0x1f,%edx
    1273:	01 d0                	add    %edx,%eax
    1275:	d1 f8                	sar    %eax
    1277:	89 45 fc             	mov    %eax,-0x4(%rbp)

	// save pivot at start
	swap (jobs, start, pivot);
    127a:	8b 55 fc             	mov    -0x4(%rbp),%edx
    127d:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
    1280:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1284:	89 ce                	mov    %ecx,%esi
    1286:	48 89 c7             	mov    %rax,%rdi
    1289:	e8 2b ff ff ff       	callq  11b9 <swap>

	int last = start; // last position of pivot
    128e:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    1291:	89 45 f4             	mov    %eax,-0xc(%rbp)

	// find last position of pivot
	for(int i = start; i <= end; i++) { 
    1294:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    1297:	89 45 f8             	mov    %eax,-0x8(%rbp)
    129a:	e9 88 00 00 00       	jmpq   1327 <sort_jobs+0xe3>
		if(jobs[i].profit > jobs[start].profit)
    129f:	8b 45 f8             	mov    -0x8(%rbp),%eax
    12a2:	48 98                	cltq   
    12a4:	48 c1 e0 04          	shl    $0x4,%rax
    12a8:	48 89 c2             	mov    %rax,%rdx
    12ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    12af:	48 01 d0             	add    %rdx,%rax
    12b2:	8b 50 04             	mov    0x4(%rax),%edx
    12b5:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    12b8:	48 98                	cltq   
    12ba:	48 c1 e0 04          	shl    $0x4,%rax
    12be:	48 89 c1             	mov    %rax,%rcx
    12c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    12c5:	48 01 c8             	add    %rcx,%rax
    12c8:	8b 40 04             	mov    0x4(%rax),%eax
    12cb:	39 c2                	cmp    %eax,%edx
    12cd:	7e 18                	jle    12e7 <sort_jobs+0xa3>
		{ swap(jobs, ++last, i); }
    12cf:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    12d3:	8b 55 f8             	mov    -0x8(%rbp),%edx
    12d6:	8b 4d f4             	mov    -0xc(%rbp),%ecx
    12d9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    12dd:	89 ce                	mov    %ecx,%esi
    12df:	48 89 c7             	mov    %rax,%rdi
    12e2:	e8 d2 fe ff ff       	callq  11b9 <swap>

		if(jobs[i].deadline > *max_deadline)
    12e7:	8b 45 f8             	mov    -0x8(%rbp),%eax
    12ea:	48 98                	cltq   
    12ec:	48 c1 e0 04          	shl    $0x4,%rax
    12f0:	48 89 c2             	mov    %rax,%rdx
    12f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    12f7:	48 01 d0             	add    %rdx,%rax
    12fa:	8b 50 08             	mov    0x8(%rax),%edx
    12fd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1301:	8b 00                	mov    (%rax),%eax
    1303:	39 c2                	cmp    %eax,%edx
    1305:	7e 1c                	jle    1323 <sort_jobs+0xdf>
			*max_deadline = jobs[i].deadline;
    1307:	8b 45 f8             	mov    -0x8(%rbp),%eax
    130a:	48 98                	cltq   
    130c:	48 c1 e0 04          	shl    $0x4,%rax
    1310:	48 89 c2             	mov    %rax,%rdx
    1313:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1317:	48 01 d0             	add    %rdx,%rax
    131a:	8b 50 08             	mov    0x8(%rax),%edx
    131d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1321:	89 10                	mov    %edx,(%rax)
	for(int i = start; i <= end; i++) { 
    1323:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    1327:	8b 45 f8             	mov    -0x8(%rbp),%eax
    132a:	3b 45 e0             	cmp    -0x20(%rbp),%eax
    132d:	0f 8e 6c ff ff ff    	jle    129f <sort_jobs+0x5b>
	}

	// restore pivot
	swap (jobs, last, start);
    1333:	8b 55 e4             	mov    -0x1c(%rbp),%edx
    1336:	8b 4d f4             	mov    -0xc(%rbp),%ecx
    1339:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    133d:	89 ce                	mov    %ecx,%esi
    133f:	48 89 c7             	mov    %rax,%rdi
    1342:	e8 72 fe ff ff       	callq  11b9 <swap>

	sort_jobs (jobs, start, last, max_deadline);
    1347:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    134b:	8b 55 f4             	mov    -0xc(%rbp),%edx
    134e:	8b 75 e4             	mov    -0x1c(%rbp),%esi
    1351:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1355:	48 89 c7             	mov    %rax,%rdi
    1358:	e8 e7 fe ff ff       	callq  1244 <sort_jobs>
	sort_jobs (jobs, last+1, end, max_deadline);
    135d:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1360:	8d 70 01             	lea    0x1(%rax),%esi
    1363:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    1367:	8b 55 e0             	mov    -0x20(%rbp),%edx
    136a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    136e:	48 89 c7             	mov    %rax,%rdi
    1371:	e8 ce fe ff ff       	callq  1244 <sort_jobs>
    1376:	eb 01                	jmp    1379 <sort_jobs+0x135>
		return;
    1378:	90                   	nop
}
    1379:	c9                   	leaveq 
    137a:	c3                   	retq   

000000000000137b <get_job_sequence>:
	int 	nslots;
	
	int 	profit;
} job_sequence;

job_sequence get_job_sequence (job *jobs, int size) {
    137b:	55                   	push   %rbp
    137c:	48 89 e5             	mov    %rsp,%rbp
    137f:	48 83 ec 60          	sub    $0x60,%rsp
    1383:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    1387:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
    138b:	89 55 ac             	mov    %edx,-0x54(%rbp)
    138e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1395:	00 00 
    1397:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    139b:	31 c0                	xor    %eax,%eax
	int max_deadline = 0, profit = 0, seq_size;
    139d:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%rbp)
    13a4:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%rbp)
	sort_jobs (jobs, 0, size-1, &max_deadline);
    13ab:	8b 45 ac             	mov    -0x54(%rbp),%eax
    13ae:	8d 70 ff             	lea    -0x1(%rax),%esi
    13b1:	48 8d 55 c0          	lea    -0x40(%rbp),%rdx
    13b5:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    13b9:	48 89 d1             	mov    %rdx,%rcx
    13bc:	89 f2                	mov    %esi,%edx
    13be:	be 00 00 00 00       	mov    $0x0,%esi
    13c3:	48 89 c7             	mov    %rax,%rdi
    13c6:	e8 79 fe ff ff       	callq  1244 <sort_jobs>

	seq_size = max_deadline + 1; 
    13cb:	8b 45 c0             	mov    -0x40(%rbp),%eax
    13ce:	83 c0 01             	add    $0x1,%eax
    13d1:	89 45 d4             	mov    %eax,-0x2c(%rbp)
	int *list = malloc (sizeof(int) * seq_size);
    13d4:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    13d7:	48 98                	cltq   
    13d9:	48 c1 e0 02          	shl    $0x2,%rax
    13dd:	48 89 c7             	mov    %rax,%rdi
    13e0:	e8 ab fc ff ff       	callq  1090 <malloc@plt>
    13e5:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
	bzero (list, sizeof(int) * seq_size);
    13e9:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    13ec:	48 98                	cltq   
    13ee:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    13f5:	00 
    13f6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    13fa:	be 00 00 00 00       	mov    $0x0,%esi
    13ff:	48 89 c7             	mov    %rax,%rdi
    1402:	e8 69 fc ff ff       	callq  1070 <memset@plt>

	for (int i = 0; i < size; i++) {
    1407:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%rbp)
    140e:	e9 99 00 00 00       	jmpq   14ac <get_job_sequence+0x131>
		job j = jobs[i];
    1413:	8b 45 c8             	mov    -0x38(%rbp),%eax
    1416:	48 98                	cltq   
    1418:	48 c1 e0 04          	shl    $0x4,%rax
    141c:	48 89 c2             	mov    %rax,%rdx
    141f:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    1423:	48 01 d0             	add    %rdx,%rax
    1426:	48 8b 50 08          	mov    0x8(%rax),%rdx
    142a:	48 8b 00             	mov    (%rax),%rax
    142d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1431:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
		int t = j.deadline - j.time_taken + 1;
    1435:	8b 55 e8             	mov    -0x18(%rbp),%edx
    1438:	8b 45 ec             	mov    -0x14(%rbp),%eax
    143b:	29 c2                	sub    %eax,%edx
    143d:	89 d0                	mov    %edx,%eax
    143f:	83 c0 01             	add    $0x1,%eax
    1442:	89 45 cc             	mov    %eax,-0x34(%rbp)

		while (t > 0) {
    1445:	eb 5b                	jmp    14a2 <get_job_sequence+0x127>
			// if this slot is empty
			if (!list[t]) {
    1447:	8b 45 cc             	mov    -0x34(%rbp),%eax
    144a:	48 98                	cltq   
    144c:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1453:	00 
    1454:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1458:	48 01 d0             	add    %rdx,%rax
    145b:	8b 00                	mov    (%rax),%eax
    145d:	85 c0                	test   %eax,%eax
    145f:	75 3b                	jne    149c <get_job_sequence+0x121>
				int slot = j.time_taken;
    1461:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1464:	89 45 d0             	mov    %eax,-0x30(%rbp)
				
				// fill all slots occupied 
				// by this job during execution
				while(slot--) 
    1467:	eb 1e                	jmp    1487 <get_job_sequence+0x10c>
					list[t+slot] = j.label; 
    1469:	8b 55 cc             	mov    -0x34(%rbp),%edx
    146c:	8b 45 d0             	mov    -0x30(%rbp),%eax
    146f:	01 d0                	add    %edx,%eax
    1471:	48 98                	cltq   
    1473:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    147a:	00 
    147b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    147f:	48 01 c2             	add    %rax,%rdx
    1482:	8b 45 e0             	mov    -0x20(%rbp),%eax
    1485:	89 02                	mov    %eax,(%rdx)
				while(slot--) 
    1487:	8b 45 d0             	mov    -0x30(%rbp),%eax
    148a:	8d 50 ff             	lea    -0x1(%rax),%edx
    148d:	89 55 d0             	mov    %edx,-0x30(%rbp)
    1490:	85 c0                	test   %eax,%eax
    1492:	75 d5                	jne    1469 <get_job_sequence+0xee>
				
				profit += j.profit;
    1494:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    1497:	01 45 c4             	add    %eax,-0x3c(%rbp)
				break;
    149a:	eb 0c                	jmp    14a8 <get_job_sequence+0x12d>
			}

			// go to the previous time slot
			t -= j.time_taken;
    149c:	8b 45 ec             	mov    -0x14(%rbp),%eax
    149f:	29 45 cc             	sub    %eax,-0x34(%rbp)
		while (t > 0) {
    14a2:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
    14a6:	7f 9f                	jg     1447 <get_job_sequence+0xcc>
	for (int i = 0; i < size; i++) {
    14a8:	83 45 c8 01          	addl   $0x1,-0x38(%rbp)
    14ac:	8b 45 c8             	mov    -0x38(%rbp),%eax
    14af:	3b 45 ac             	cmp    -0x54(%rbp),%eax
    14b2:	0f 8c 5b ff ff ff    	jl     1413 <get_job_sequence+0x98>
		}
	}

	return (job_sequence) {.jobs = jobs, .njobs = size, 
    14b8:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    14bc:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
    14c0:	48 89 10             	mov    %rdx,(%rax)
    14c3:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    14c7:	8b 55 ac             	mov    -0x54(%rbp),%edx
    14ca:	89 50 08             	mov    %edx,0x8(%rax)
    14cd:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    14d1:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    14d5:	48 89 50 10          	mov    %rdx,0x10(%rax)
    14d9:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    14dd:	8b 55 d4             	mov    -0x2c(%rbp),%edx
    14e0:	89 50 18             	mov    %edx,0x18(%rax)
    14e3:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    14e7:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    14ea:	89 50 1c             	mov    %edx,0x1c(%rax)
		.list = list, .nslots = seq_size, .profit = profit }; 
}
    14ed:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    14f1:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    14f5:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    14fc:	00 00 
    14fe:	74 05                	je     1505 <get_job_sequence+0x18a>
    1500:	e8 4b fb ff ff       	callq  1050 <__stack_chk_fail@plt>
    1505:	c9                   	leaveq 
    1506:	c3                   	retq   

0000000000001507 <unregister>:

void unregister (job_sequence seq) {
    1507:	55                   	push   %rbp
    1508:	48 89 e5             	mov    %rsp,%rbp
	free(seq.list); seq.list = NULL;
    150b:	48 8b 45 20          	mov    0x20(%rbp),%rax
    150f:	48 89 c7             	mov    %rax,%rdi
    1512:	e8 19 fb ff ff       	callq  1030 <free@plt>
    1517:	48 c7 45 20 00 00 00 	movq   $0x0,0x20(%rbp)
    151e:	00 
	free(seq.jobs); seq.jobs = NULL;
    151f:	48 8b 45 10          	mov    0x10(%rbp),%rax
    1523:	48 89 c7             	mov    %rax,%rdi
    1526:	e8 05 fb ff ff       	callq  1030 <free@plt>
    152b:	48 c7 45 10 00 00 00 	movq   $0x0,0x10(%rbp)
    1532:	00 
	seq.njobs = seq.nslots = seq.profit = 0;
    1533:	c7 45 2c 00 00 00 00 	movl   $0x0,0x2c(%rbp)
    153a:	8b 45 2c             	mov    0x2c(%rbp),%eax
    153d:	89 45 28             	mov    %eax,0x28(%rbp)
    1540:	8b 45 28             	mov    0x28(%rbp),%eax
    1543:	89 45 18             	mov    %eax,0x18(%rbp)
}
    1546:	90                   	nop
    1547:	5d                   	pop    %rbp
    1548:	c3                   	retq   

0000000000001549 <read_jobs>:

void read_jobs (job *jobs, int njobs, FILE *infile) {
    1549:	55                   	push   %rbp
    154a:	48 89 e5             	mov    %rsp,%rbp
    154d:	48 83 ec 30          	sub    $0x30,%rsp
    1551:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1555:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    1558:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
	for (int i = 0; i < njobs; i++) {
    155c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    1563:	e9 97 00 00 00       	jmpq   15ff <read_jobs+0xb6>
		job *j = jobs+i;
    1568:	8b 45 f4             	mov    -0xc(%rbp),%eax
    156b:	48 98                	cltq   
    156d:	48 c1 e0 04          	shl    $0x4,%rax
    1571:	48 89 c2             	mov    %rax,%rdx
    1574:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1578:	48 01 d0             	add    %rdx,%rax
    157b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
		
		fscanf(infile, "%d", &j->label);
    157f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1583:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1587:	48 8d 35 7a 0a 00 00 	lea    0xa7a(%rip),%rsi        # 2008 <_IO_stdin_used+0x8>
    158e:	48 89 c7             	mov    %rax,%rdi
    1591:	b8 00 00 00 00       	mov    $0x0,%eax
    1596:	e8 a5 fa ff ff       	callq  1040 <__isoc99_fscanf@plt>
		fscanf(infile, "%d", &j->profit);
    159b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    159f:	48 8d 50 04          	lea    0x4(%rax),%rdx
    15a3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    15a7:	48 8d 35 5a 0a 00 00 	lea    0xa5a(%rip),%rsi        # 2008 <_IO_stdin_used+0x8>
    15ae:	48 89 c7             	mov    %rax,%rdi
    15b1:	b8 00 00 00 00       	mov    $0x0,%eax
    15b6:	e8 85 fa ff ff       	callq  1040 <__isoc99_fscanf@plt>
		fscanf(infile, "%d", &j->deadline);
    15bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    15bf:	48 8d 50 08          	lea    0x8(%rax),%rdx
    15c3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    15c7:	48 8d 35 3a 0a 00 00 	lea    0xa3a(%rip),%rsi        # 2008 <_IO_stdin_used+0x8>
    15ce:	48 89 c7             	mov    %rax,%rdi
    15d1:	b8 00 00 00 00       	mov    $0x0,%eax
    15d6:	e8 65 fa ff ff       	callq  1040 <__isoc99_fscanf@plt>
		fscanf(infile, "%d", &j->time_taken);
    15db:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    15df:	48 8d 50 0c          	lea    0xc(%rax),%rdx
    15e3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    15e7:	48 8d 35 1a 0a 00 00 	lea    0xa1a(%rip),%rsi        # 2008 <_IO_stdin_used+0x8>
    15ee:	48 89 c7             	mov    %rax,%rdi
    15f1:	b8 00 00 00 00       	mov    $0x0,%eax
    15f6:	e8 45 fa ff ff       	callq  1040 <__isoc99_fscanf@plt>
	for (int i = 0; i < njobs; i++) {
    15fb:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    15ff:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1602:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
    1605:	0f 8c 5d ff ff ff    	jl     1568 <read_jobs+0x1f>
	}
}
    160b:	90                   	nop
    160c:	c9                   	leaveq 
    160d:	c3                   	retq   

000000000000160e <write_jobs>:

void write_jobs (job *jobs, int njobs, FILE *outfile) {
    160e:	55                   	push   %rbp
    160f:	48 89 e5             	mov    %rsp,%rbp
    1612:	48 83 ec 40          	sub    $0x40,%rsp
    1616:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    161a:	89 75 d4             	mov    %esi,-0x2c(%rbp)
    161d:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
	fprintf (outfile, "%-5s %-6s %-8s %-10s\n", 
    1621:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1625:	4c 8d 0d df 09 00 00 	lea    0x9df(%rip),%r9        # 200b <_IO_stdin_used+0xb>
    162c:	4c 8d 05 e3 09 00 00 	lea    0x9e3(%rip),%r8        # 2016 <_IO_stdin_used+0x16>
    1633:	48 8d 0d e5 09 00 00 	lea    0x9e5(%rip),%rcx        # 201f <_IO_stdin_used+0x1f>
    163a:	48 8d 15 e5 09 00 00 	lea    0x9e5(%rip),%rdx        # 2026 <_IO_stdin_used+0x26>
    1641:	48 8d 35 e4 09 00 00 	lea    0x9e4(%rip),%rsi        # 202c <_IO_stdin_used+0x2c>
    1648:	48 89 c7             	mov    %rax,%rdi
    164b:	b8 00 00 00 00       	mov    $0x0,%eax
    1650:	e8 2b fa ff ff       	callq  1080 <fprintf@plt>
			"label", "profit", "deadline", "time_taken");

	for (int i = 0; i < njobs; i++) {
    1655:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    165c:	eb 50                	jmp    16ae <write_jobs+0xa0>
		job j = jobs[i];
    165e:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1661:	48 98                	cltq   
    1663:	48 c1 e0 04          	shl    $0x4,%rax
    1667:	48 89 c2             	mov    %rax,%rdx
    166a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    166e:	48 01 d0             	add    %rdx,%rax
    1671:	48 8b 50 08          	mov    0x8(%rax),%rdx
    1675:	48 8b 00             	mov    (%rax),%rax
    1678:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    167c:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
		fprintf (outfile, "%-5d %-6d %-8d %-10d\n", 
    1680:	8b 7d fc             	mov    -0x4(%rbp),%edi
    1683:	8b 75 f8             	mov    -0x8(%rbp),%esi
    1686:	8b 4d f4             	mov    -0xc(%rbp),%ecx
    1689:	8b 55 f0             	mov    -0x10(%rbp),%edx
    168c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1690:	41 89 f9             	mov    %edi,%r9d
    1693:	41 89 f0             	mov    %esi,%r8d
    1696:	48 8d 35 a5 09 00 00 	lea    0x9a5(%rip),%rsi        # 2042 <_IO_stdin_used+0x42>
    169d:	48 89 c7             	mov    %rax,%rdi
    16a0:	b8 00 00 00 00       	mov    $0x0,%eax
    16a5:	e8 d6 f9 ff ff       	callq  1080 <fprintf@plt>
	for (int i = 0; i < njobs; i++) {
    16aa:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
    16ae:	8b 45 ec             	mov    -0x14(%rbp),%eax
    16b1:	3b 45 d4             	cmp    -0x2c(%rbp),%eax
    16b4:	7c a8                	jl     165e <write_jobs+0x50>
			j.label, j.profit, j.deadline, j.time_taken);

	}
}
    16b6:	90                   	nop
    16b7:	c9                   	leaveq 
    16b8:	c3                   	retq   

00000000000016b9 <write_job_seq>:

void write_job_seq (job_sequence seq, FILE *outfile) {
    16b9:	55                   	push   %rbp
    16ba:	48 89 e5             	mov    %rsp,%rbp
    16bd:	48 83 ec 20          	sub    $0x20,%rsp
    16c1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
	fprintf (outfile, "Jobs that were sequenced:\n"); 
    16c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    16c9:	48 89 c1             	mov    %rax,%rcx
    16cc:	ba 1a 00 00 00       	mov    $0x1a,%edx
    16d1:	be 01 00 00 00       	mov    $0x1,%esi
    16d6:	48 8d 3d 7b 09 00 00 	lea    0x97b(%rip),%rdi        # 2058 <_IO_stdin_used+0x58>
    16dd:	e8 ce f9 ff ff       	callq  10b0 <fwrite@plt>
	write_jobs (seq.jobs, seq.njobs, outfile);
    16e2:	8b 4d 18             	mov    0x18(%rbp),%ecx
    16e5:	48 8b 45 10          	mov    0x10(%rbp),%rax
    16e9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    16ed:	89 ce                	mov    %ecx,%esi
    16ef:	48 89 c7             	mov    %rax,%rdi
    16f2:	e8 17 ff ff ff       	callq  160e <write_jobs>

	fprintf (outfile, "Computed job sequence:\n");
    16f7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    16fb:	48 89 c1             	mov    %rax,%rcx
    16fe:	ba 17 00 00 00       	mov    $0x17,%edx
    1703:	be 01 00 00 00       	mov    $0x1,%esi
    1708:	48 8d 3d 64 09 00 00 	lea    0x964(%rip),%rdi        # 2073 <_IO_stdin_used+0x73>
    170f:	e8 9c f9 ff ff       	callq  10b0 <fwrite@plt>
	for (int i = 1; i < seq.nslots; i++) 
    1714:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
    171b:	eb 2f                	jmp    174c <write_job_seq+0x93>
		fprintf(outfile, "%d ", seq.list[i]);
    171d:	48 8b 45 20          	mov    0x20(%rbp),%rax
    1721:	8b 55 fc             	mov    -0x4(%rbp),%edx
    1724:	48 63 d2             	movslq %edx,%rdx
    1727:	48 c1 e2 02          	shl    $0x2,%rdx
    172b:	48 01 d0             	add    %rdx,%rax
    172e:	8b 10                	mov    (%rax),%edx
    1730:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1734:	48 8d 35 50 09 00 00 	lea    0x950(%rip),%rsi        # 208b <_IO_stdin_used+0x8b>
    173b:	48 89 c7             	mov    %rax,%rdi
    173e:	b8 00 00 00 00       	mov    $0x0,%eax
    1743:	e8 38 f9 ff ff       	callq  1080 <fprintf@plt>
	for (int i = 1; i < seq.nslots; i++) 
    1748:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    174c:	8b 45 28             	mov    0x28(%rbp),%eax
    174f:	39 45 fc             	cmp    %eax,-0x4(%rbp)
    1752:	7c c9                	jl     171d <write_job_seq+0x64>

	fprintf(outfile, "\nTotal profit: %d\n", seq.profit);
    1754:	8b 55 2c             	mov    0x2c(%rbp),%edx
    1757:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    175b:	48 8d 35 2d 09 00 00 	lea    0x92d(%rip),%rsi        # 208f <_IO_stdin_used+0x8f>
    1762:	48 89 c7             	mov    %rax,%rdi
    1765:	b8 00 00 00 00       	mov    $0x0,%eax
    176a:	e8 11 f9 ff ff       	callq  1080 <fprintf@plt>
}
    176f:	90                   	nop
    1770:	c9                   	leaveq 
    1771:	c3                   	retq   

0000000000001772 <main>:

int main (int argc, char *args[]) {
    1772:	55                   	push   %rbp
    1773:	48 89 e5             	mov    %rsp,%rbp
    1776:	48 83 ec 50          	sub    $0x50,%rsp
    177a:	89 7d bc             	mov    %edi,-0x44(%rbp)
    177d:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
    1781:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1788:	00 00 
    178a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    178e:	31 c0                	xor    %eax,%eax
	printf ("Enter number of jobs to be entered: ");
    1790:	48 8d 3d 11 09 00 00 	lea    0x911(%rip),%rdi        # 20a8 <_IO_stdin_used+0xa8>
    1797:	b8 00 00 00 00       	mov    $0x0,%eax
    179c:	e8 bf f8 ff ff       	callq  1060 <printf@plt>
	int njobs; scanf("%d", &njobs);
    17a1:	48 8d 45 c4          	lea    -0x3c(%rbp),%rax
    17a5:	48 89 c6             	mov    %rax,%rsi
    17a8:	48 8d 3d 59 08 00 00 	lea    0x859(%rip),%rdi        # 2008 <_IO_stdin_used+0x8>
    17af:	b8 00 00 00 00       	mov    $0x0,%eax
    17b4:	e8 e7 f8 ff ff       	callq  10a0 <__isoc99_scanf@plt>

	job *jobs = malloc (sizeof(job) * njobs);
    17b9:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    17bc:	48 98                	cltq   
    17be:	48 c1 e0 04          	shl    $0x4,%rax
    17c2:	48 89 c7             	mov    %rax,%rdi
    17c5:	e8 c6 f8 ff ff       	callq  1090 <malloc@plt>
    17ca:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
	
	fprintf (stdout, "%-5s %-5s %-8s %-10s\n", 
    17ce:	48 8b 05 9b 28 00 00 	mov    0x289b(%rip),%rax        # 4070 <stdout@@GLIBC_2.2.5>
    17d5:	4c 8d 0d 2f 08 00 00 	lea    0x82f(%rip),%r9        # 200b <_IO_stdin_used+0xb>
    17dc:	4c 8d 05 33 08 00 00 	lea    0x833(%rip),%r8        # 2016 <_IO_stdin_used+0x16>
    17e3:	48 8d 0d 35 08 00 00 	lea    0x835(%rip),%rcx        # 201f <_IO_stdin_used+0x1f>
    17ea:	48 8d 15 35 08 00 00 	lea    0x835(%rip),%rdx        # 2026 <_IO_stdin_used+0x26>
    17f1:	48 8d 35 d5 08 00 00 	lea    0x8d5(%rip),%rsi        # 20cd <_IO_stdin_used+0xcd>
    17f8:	48 89 c7             	mov    %rax,%rdi
    17fb:	b8 00 00 00 00       	mov    $0x0,%eax
    1800:	e8 7b f8 ff ff       	callq  1080 <fprintf@plt>
			"label", "profit", "deadline", "time_taken");

	read_jobs (jobs, njobs, stdin);
    1805:	48 8b 15 74 28 00 00 	mov    0x2874(%rip),%rdx        # 4080 <stdin@@GLIBC_2.2.5>
    180c:	8b 4d c4             	mov    -0x3c(%rbp),%ecx
    180f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1813:	89 ce                	mov    %ecx,%esi
    1815:	48 89 c7             	mov    %rax,%rdi
    1818:	e8 2c fd ff ff       	callq  1549 <read_jobs>

	job_sequence seq = get_job_sequence(jobs, njobs);
    181d:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    1820:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    1824:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    1828:	48 89 ce             	mov    %rcx,%rsi
    182b:	48 89 c7             	mov    %rax,%rdi
    182e:	e8 48 fb ff ff       	callq  137b <get_job_sequence>
	write_job_seq (seq, stdout);
    1833:	48 8b 05 36 28 00 00 	mov    0x2836(%rip),%rax        # 4070 <stdout@@GLIBC_2.2.5>
    183a:	ff 75 e8             	pushq  -0x18(%rbp)
    183d:	ff 75 e0             	pushq  -0x20(%rbp)
    1840:	ff 75 d8             	pushq  -0x28(%rbp)
    1843:	ff 75 d0             	pushq  -0x30(%rbp)
    1846:	48 89 c7             	mov    %rax,%rdi
    1849:	e8 6b fe ff ff       	callq  16b9 <write_job_seq>
    184e:	48 83 c4 20          	add    $0x20,%rsp
	
	unregister (seq);
    1852:	ff 75 e8             	pushq  -0x18(%rbp)
    1855:	ff 75 e0             	pushq  -0x20(%rbp)
    1858:	ff 75 d8             	pushq  -0x28(%rbp)
    185b:	ff 75 d0             	pushq  -0x30(%rbp)
    185e:	e8 a4 fc ff ff       	callq  1507 <unregister>
    1863:	48 83 c4 20          	add    $0x20,%rsp
	return 0;
    1867:	b8 00 00 00 00       	mov    $0x0,%eax
}
    186c:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    1870:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    1877:	00 00 
    1879:	74 05                	je     1880 <main+0x10e>
    187b:	e8 d0 f7 ff ff       	callq  1050 <__stack_chk_fail@plt>
    1880:	c9                   	leaveq 
    1881:	c3                   	retq   
    1882:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    1889:	00 00 00 
    188c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001890 <__libc_csu_init>:
    1890:	f3 0f 1e fa          	endbr64 
    1894:	41 57                	push   %r15
    1896:	49 89 d7             	mov    %rdx,%r15
    1899:	41 56                	push   %r14
    189b:	49 89 f6             	mov    %rsi,%r14
    189e:	41 55                	push   %r13
    18a0:	41 89 fd             	mov    %edi,%r13d
    18a3:	41 54                	push   %r12
    18a5:	4c 8d 25 3c 25 00 00 	lea    0x253c(%rip),%r12        # 3de8 <__frame_dummy_init_array_entry>
    18ac:	55                   	push   %rbp
    18ad:	48 8d 2d 3c 25 00 00 	lea    0x253c(%rip),%rbp        # 3df0 <__init_array_end>
    18b4:	53                   	push   %rbx
    18b5:	4c 29 e5             	sub    %r12,%rbp
    18b8:	48 83 ec 08          	sub    $0x8,%rsp
    18bc:	67 e8 3e f7 ff ff    	addr32 callq 1000 <_init>
    18c2:	48 c1 fd 03          	sar    $0x3,%rbp
    18c6:	74 1e                	je     18e6 <__libc_csu_init+0x56>
    18c8:	31 db                	xor    %ebx,%ebx
    18ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    18d0:	4c 89 fa             	mov    %r15,%rdx
    18d3:	4c 89 f6             	mov    %r14,%rsi
    18d6:	44 89 ef             	mov    %r13d,%edi
    18d9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
    18dd:	48 83 c3 01          	add    $0x1,%rbx
    18e1:	48 39 dd             	cmp    %rbx,%rbp
    18e4:	75 ea                	jne    18d0 <__libc_csu_init+0x40>
    18e6:	48 83 c4 08          	add    $0x8,%rsp
    18ea:	5b                   	pop    %rbx
    18eb:	5d                   	pop    %rbp
    18ec:	41 5c                	pop    %r12
    18ee:	41 5d                	pop    %r13
    18f0:	41 5e                	pop    %r14
    18f2:	41 5f                	pop    %r15
    18f4:	c3                   	retq   
    18f5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    18fc:	00 00 00 00 

0000000000001900 <__libc_csu_fini>:
    1900:	f3 0f 1e fa          	endbr64 
    1904:	c3                   	retq   

Disassembly of section .fini:

0000000000001908 <_fini>:
    1908:	f3 0f 1e fa          	endbr64 
    190c:	48 83 ec 08          	sub    $0x8,%rsp
    1910:	48 83 c4 08          	add    $0x8,%rsp
    1914:	c3                   	retq   
