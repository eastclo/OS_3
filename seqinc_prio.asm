
_seqinc_prio:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
            for (j = 0; j < 1024 * 10; j++)
                data[j]++;
    }
}
int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
    if (argc < 2)
  14:	83 39 01             	cmpl   $0x1,(%ecx)
{
  17:	8b 41 04             	mov    0x4(%ecx),%eax
    if (argc < 2)
  1a:	0f 8e aa 00 00 00    	jle    ca <main+0xca>
    {
        printf(1, "test-case <number-of-children>\n");
        exit();
    }
    int N = atoi(argv[1]);
  20:	83 ec 0c             	sub    $0xc,%esp
  23:	ff 70 04             	pushl  0x4(%eax)
  26:	e8 f5 03 00 00       	call   420 <atoi>

    int pids[N];
  2b:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
    int N = atoi(argv[1]);
  32:	89 c6                	mov    %eax,%esi
    int pids[N];
  34:	83 c4 10             	add    $0x10,%esp
  37:	8d 43 12             	lea    0x12(%ebx),%eax
  3a:	83 e0 f0             	and    $0xfffffff0,%eax
  3d:	29 c4                	sub    %eax,%esp
  3f:	89 65 e4             	mov    %esp,-0x1c(%ebp)
    int rets[N];
  42:	29 c4                	sub    %eax,%esp
  44:	89 65 e0             	mov    %esp,-0x20(%ebp)
    if(set_prio(1000) < 0)
  47:	83 ec 0c             	sub    $0xc,%esp
  4a:	68 e8 03 00 00       	push   $0x3e8
  4f:	e8 06 05 00 00       	call   55a <set_prio>
  54:	83 c4 10             	add    $0x10,%esp
  57:	85 c0                	test   %eax,%eax
  59:	0f 88 21 01 00 00    	js     180 <main+0x180>
		printf(1, "set priority error for parent process\n");
    printf(1, "Priority of parent process = %d\n", get_prio());
  5f:	e8 fe 04 00 00       	call   562 <get_prio>
  64:	52                   	push   %edx
  65:	50                   	push   %eax
  66:	68 18 0a 00 00       	push   $0xa18
  6b:	6a 01                	push   $0x1
  6d:	e8 9e 05 00 00       	call   610 <printf>

    for (int i = 0; i < N; i++)
  72:	83 c4 10             	add    $0x10,%esp
  75:	85 f6                	test   %esi,%esi
  77:	0f 8e 2f 01 00 00    	jle    1ac <main+0x1ac>
  7d:	31 ff                	xor    %edi,%edi
  7f:	eb 16                	jmp    97 <main+0x97>
  81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    		if(set_prio(priority) < 0)
				printf(1, "set priority error for child erocess\n");
			delay(20);
            exit();
        }
        else if (ret > 0)
  88:	7e 53                	jle    dd <main+0xdd>
        {
            pids[i] = ret;
  8a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  8d:	89 04 ba             	mov    %eax,(%edx,%edi,4)
    for (int i = 0; i < N; i++)
  90:	83 c7 01             	add    $0x1,%edi
  93:	39 fe                	cmp    %edi,%esi
  95:	74 59                	je     f0 <main+0xf0>
        int ret = fork();
  97:	e8 ee 03 00 00       	call   48a <fork>
        if (ret == 0)
  9c:	83 f8 00             	cmp    $0x0,%eax
  9f:	75 e7                	jne    88 <main+0x88>
        int priority = 10*i + 1 ;
  a1:	6b d7 0a             	imul   $0xa,%edi,%edx
    		if(set_prio(priority) < 0)
  a4:	83 ec 0c             	sub    $0xc,%esp
        int priority = 10*i + 1 ;
  a7:	83 c2 01             	add    $0x1,%edx
    		if(set_prio(priority) < 0)
  aa:	52                   	push   %edx
  ab:	e8 aa 04 00 00       	call   55a <set_prio>
  b0:	83 c4 10             	add    $0x10,%esp
  b3:	85 c0                	test   %eax,%eax
  b5:	0f 88 db 00 00 00    	js     196 <main+0x196>
			delay(20);
  bb:	83 ec 0c             	sub    $0xc,%esp
  be:	6a 14                	push   $0x14
  c0:	e8 0b 01 00 00       	call   1d0 <delay>
            exit();
  c5:	e8 c8 03 00 00       	call   492 <exit>
        printf(1, "test-case <number-of-children>\n");
  ca:	53                   	push   %ebx
  cb:	53                   	push   %ebx
  cc:	68 d0 09 00 00       	push   $0x9d0
  d1:	6a 01                	push   $0x1
  d3:	e8 38 05 00 00       	call   610 <printf>
        exit();
  d8:	e8 b5 03 00 00       	call   492 <exit>
        }
        else
        {
            printf(1, "fork error \n");
  dd:	57                   	push   %edi
  de:	57                   	push   %edi
  df:	68 85 09 00 00       	push   $0x985
  e4:	6a 01                	push   $0x1
  e6:	e8 25 05 00 00       	call   610 <printf>
            exit();
  eb:	e8 a2 03 00 00       	call   492 <exit>
  f0:	8b 75 e0             	mov    -0x20(%ebp),%esi
  f3:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
    for (int i = 0; i < N; i++)
  f6:	89 f3                	mov    %esi,%ebx
  f8:	89 45 e0             	mov    %eax,-0x20(%ebp)
  fb:	90                   	nop
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        }
    }

    for (int i = 0; i < N; i++)
    {
        rets[i] = wait();
 100:	e8 95 03 00 00       	call   49a <wait>
 105:	83 c3 04             	add    $0x4,%ebx
 108:	89 43 fc             	mov    %eax,-0x4(%ebx)
    for (int i = 0; i < N; i++)
 10b:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
 10e:	75 f0                	jne    100 <main+0x100>
    }

    printf(1, "\nAll children completed\n");
 110:	52                   	push   %edx
 111:	52                   	push   %edx
 112:	68 92 09 00 00       	push   $0x992
 117:	6a 01                	push   $0x1
 119:	e8 f2 04 00 00       	call   610 <printf>
 11e:	83 c4 10             	add    $0x10,%esp
 121:	31 c0                	xor    %eax,%eax
 123:	90                   	nop
 124:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (int i = 0; i < N; i++)
        printf(1, "Child %d.    pid %d\n", i, pids[i]);
 128:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 12b:	89 45 e0             	mov    %eax,-0x20(%ebp)
 12e:	ff 34 81             	pushl  (%ecx,%eax,4)
 131:	50                   	push   %eax
 132:	68 b9 09 00 00       	push   $0x9b9
 137:	6a 01                	push   $0x1
 139:	e8 d2 04 00 00       	call   610 <printf>
    for (int i = 0; i < N; i++)
 13e:	8b 45 e0             	mov    -0x20(%ebp),%eax
 141:	83 c4 10             	add    $0x10,%esp
 144:	83 c0 01             	add    $0x1,%eax
 147:	39 f8                	cmp    %edi,%eax
 149:	75 dd                	jne    128 <main+0x128>

    printf(1, "\nExit order \n");
 14b:	50                   	push   %eax
 14c:	50                   	push   %eax
 14d:	68 ab 09 00 00       	push   $0x9ab
 152:	6a 01                	push   $0x1
 154:	e8 b7 04 00 00       	call   610 <printf>
 159:	83 c4 10             	add    $0x10,%esp
 15c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (int i = 0; i < N; i++)
        printf(1, "pid %d\n", rets[i]);
 160:	83 ec 04             	sub    $0x4,%esp
 163:	ff 36                	pushl  (%esi)
 165:	83 c6 04             	add    $0x4,%esi
 168:	68 c6 09 00 00       	push   $0x9c6
 16d:	6a 01                	push   $0x1
 16f:	e8 9c 04 00 00       	call   610 <printf>
    for (int i = 0; i < N; i++)
 174:	83 c4 10             	add    $0x10,%esp
 177:	39 f3                	cmp    %esi,%ebx
 179:	75 e5                	jne    160 <main+0x160>

    exit();
 17b:	e8 12 03 00 00       	call   492 <exit>
		printf(1, "set priority error for parent process\n");
 180:	51                   	push   %ecx
 181:	51                   	push   %ecx
 182:	68 f0 09 00 00       	push   $0x9f0
 187:	6a 01                	push   $0x1
 189:	e8 82 04 00 00       	call   610 <printf>
 18e:	83 c4 10             	add    $0x10,%esp
 191:	e9 c9 fe ff ff       	jmp    5f <main+0x5f>
				printf(1, "set priority error for child erocess\n");
 196:	50                   	push   %eax
 197:	50                   	push   %eax
 198:	68 3c 0a 00 00       	push   $0xa3c
 19d:	6a 01                	push   $0x1
 19f:	e8 6c 04 00 00       	call   610 <printf>
 1a4:	83 c4 10             	add    $0x10,%esp
 1a7:	e9 0f ff ff ff       	jmp    bb <main+0xbb>
    printf(1, "\nAll children completed\n");
 1ac:	51                   	push   %ecx
 1ad:	51                   	push   %ecx
 1ae:	68 92 09 00 00       	push   $0x992
 1b3:	6a 01                	push   $0x1
 1b5:	e8 56 04 00 00       	call   610 <printf>
    printf(1, "\nExit order \n");
 1ba:	5b                   	pop    %ebx
 1bb:	5e                   	pop    %esi
 1bc:	68 ab 09 00 00       	push   $0x9ab
 1c1:	6a 01                	push   $0x1
 1c3:	e8 48 04 00 00       	call   610 <printf>
 1c8:	83 c4 10             	add    $0x10,%esp
 1cb:	eb ae                	jmp    17b <main+0x17b>
 1cd:	66 90                	xchg   %ax,%ax
 1cf:	90                   	nop

000001d0 <delay>:
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	56                   	push   %esi
 1d5:	53                   	push   %ebx
 1d6:	83 ec 18             	sub    $0x18,%esp
 1d9:	8b 7d 08             	mov    0x8(%ebp),%edi
    data = (int *)malloc(sizeof(int) * 1024 * 10);
 1dc:	68 00 a0 00 00       	push   $0xa000
 1e1:	e8 8a 06 00 00       	call   870 <malloc>
    if (data <= 0)
 1e6:	83 c4 10             	add    $0x10,%esp
 1e9:	85 c0                	test   %eax,%eax
    data = (int *)malloc(sizeof(int) * 1024 * 10);
 1eb:	89 c3                	mov    %eax,%ebx
    if (data <= 0)
 1ed:	75 12                	jne    201 <delay+0x31>
        printf(1, "Error on memory allocation \n");
 1ef:	83 ec 08             	sub    $0x8,%esp
 1f2:	68 68 09 00 00       	push   $0x968
 1f7:	6a 01                	push   $0x1
 1f9:	e8 12 04 00 00       	call   610 <printf>
 1fe:	83 c4 10             	add    $0x10,%esp
    for (i = 0; i < count; i++)
 201:	31 f6                	xor    %esi,%esi
 203:	85 ff                	test   %edi,%edi
 205:	8d 8b 00 a0 00 00    	lea    0xa000(%ebx),%ecx
 20b:	7e 29                	jle    236 <delay+0x66>
{
 20d:	b8 44 16 00 00       	mov    $0x1644,%eax
 212:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 218:	89 da                	mov    %ebx,%edx
 21a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                data[j]++;
 220:	83 02 01             	addl   $0x1,(%edx)
 223:	83 c2 04             	add    $0x4,%edx
            for (j = 0; j < 1024 * 10; j++)
 226:	39 ca                	cmp    %ecx,%edx
 228:	75 f6                	jne    220 <delay+0x50>
        for (k = 0; k < 5700; k++)
 22a:	83 e8 01             	sub    $0x1,%eax
 22d:	75 e9                	jne    218 <delay+0x48>
    for (i = 0; i < count; i++)
 22f:	83 c6 01             	add    $0x1,%esi
 232:	39 f7                	cmp    %esi,%edi
 234:	75 d7                	jne    20d <delay+0x3d>
}
 236:	8d 65 f4             	lea    -0xc(%ebp),%esp
 239:	5b                   	pop    %ebx
 23a:	5e                   	pop    %esi
 23b:	5f                   	pop    %edi
 23c:	5d                   	pop    %ebp
 23d:	c3                   	ret    
 23e:	66 90                	xchg   %ax,%ax

00000240 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 45 08             	mov    0x8(%ebp),%eax
 247:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 24a:	89 c2                	mov    %eax,%edx
 24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 250:	83 c1 01             	add    $0x1,%ecx
 253:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 257:	83 c2 01             	add    $0x1,%edx
 25a:	84 db                	test   %bl,%bl
 25c:	88 5a ff             	mov    %bl,-0x1(%edx)
 25f:	75 ef                	jne    250 <strcpy+0x10>
    ;
  return os;
}
 261:	5b                   	pop    %ebx
 262:	5d                   	pop    %ebp
 263:	c3                   	ret    
 264:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 26a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000270 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	53                   	push   %ebx
 274:	8b 55 08             	mov    0x8(%ebp),%edx
 277:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 27a:	0f b6 02             	movzbl (%edx),%eax
 27d:	0f b6 19             	movzbl (%ecx),%ebx
 280:	84 c0                	test   %al,%al
 282:	75 1c                	jne    2a0 <strcmp+0x30>
 284:	eb 2a                	jmp    2b0 <strcmp+0x40>
 286:	8d 76 00             	lea    0x0(%esi),%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 290:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 293:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 296:	83 c1 01             	add    $0x1,%ecx
 299:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 29c:	84 c0                	test   %al,%al
 29e:	74 10                	je     2b0 <strcmp+0x40>
 2a0:	38 d8                	cmp    %bl,%al
 2a2:	74 ec                	je     290 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 2a4:	29 d8                	sub    %ebx,%eax
}
 2a6:	5b                   	pop    %ebx
 2a7:	5d                   	pop    %ebp
 2a8:	c3                   	ret    
 2a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2b0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 2b2:	29 d8                	sub    %ebx,%eax
}
 2b4:	5b                   	pop    %ebx
 2b5:	5d                   	pop    %ebp
 2b6:	c3                   	ret    
 2b7:	89 f6                	mov    %esi,%esi
 2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002c0 <strlen>:

uint
strlen(const char *s)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2c6:	80 39 00             	cmpb   $0x0,(%ecx)
 2c9:	74 15                	je     2e0 <strlen+0x20>
 2cb:	31 d2                	xor    %edx,%edx
 2cd:	8d 76 00             	lea    0x0(%esi),%esi
 2d0:	83 c2 01             	add    $0x1,%edx
 2d3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 2d7:	89 d0                	mov    %edx,%eax
 2d9:	75 f5                	jne    2d0 <strlen+0x10>
    ;
  return n;
}
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret    
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 2e0:	31 c0                	xor    %eax,%eax
}
 2e2:	5d                   	pop    %ebp
 2e3:	c3                   	ret    
 2e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000002f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	57                   	push   %edi
 2f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 2fd:	89 d7                	mov    %edx,%edi
 2ff:	fc                   	cld    
 300:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 302:	89 d0                	mov    %edx,%eax
 304:	5f                   	pop    %edi
 305:	5d                   	pop    %ebp
 306:	c3                   	ret    
 307:	89 f6                	mov    %esi,%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000310 <strchr>:

char*
strchr(const char *s, char c)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	53                   	push   %ebx
 314:	8b 45 08             	mov    0x8(%ebp),%eax
 317:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 31a:	0f b6 10             	movzbl (%eax),%edx
 31d:	84 d2                	test   %dl,%dl
 31f:	74 1d                	je     33e <strchr+0x2e>
    if(*s == c)
 321:	38 d3                	cmp    %dl,%bl
 323:	89 d9                	mov    %ebx,%ecx
 325:	75 0d                	jne    334 <strchr+0x24>
 327:	eb 17                	jmp    340 <strchr+0x30>
 329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 330:	38 ca                	cmp    %cl,%dl
 332:	74 0c                	je     340 <strchr+0x30>
  for(; *s; s++)
 334:	83 c0 01             	add    $0x1,%eax
 337:	0f b6 10             	movzbl (%eax),%edx
 33a:	84 d2                	test   %dl,%dl
 33c:	75 f2                	jne    330 <strchr+0x20>
      return (char*)s;
  return 0;
 33e:	31 c0                	xor    %eax,%eax
}
 340:	5b                   	pop    %ebx
 341:	5d                   	pop    %ebp
 342:	c3                   	ret    
 343:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000350 <gets>:

char*
gets(char *buf, int max)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	56                   	push   %esi
 355:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 356:	31 f6                	xor    %esi,%esi
 358:	89 f3                	mov    %esi,%ebx
{
 35a:	83 ec 1c             	sub    $0x1c,%esp
 35d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 360:	eb 2f                	jmp    391 <gets+0x41>
 362:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 368:	8d 45 e7             	lea    -0x19(%ebp),%eax
 36b:	83 ec 04             	sub    $0x4,%esp
 36e:	6a 01                	push   $0x1
 370:	50                   	push   %eax
 371:	6a 00                	push   $0x0
 373:	e8 32 01 00 00       	call   4aa <read>
    if(cc < 1)
 378:	83 c4 10             	add    $0x10,%esp
 37b:	85 c0                	test   %eax,%eax
 37d:	7e 1c                	jle    39b <gets+0x4b>
      break;
    buf[i++] = c;
 37f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 383:	83 c7 01             	add    $0x1,%edi
 386:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 389:	3c 0a                	cmp    $0xa,%al
 38b:	74 23                	je     3b0 <gets+0x60>
 38d:	3c 0d                	cmp    $0xd,%al
 38f:	74 1f                	je     3b0 <gets+0x60>
  for(i=0; i+1 < max; ){
 391:	83 c3 01             	add    $0x1,%ebx
 394:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 397:	89 fe                	mov    %edi,%esi
 399:	7c cd                	jl     368 <gets+0x18>
 39b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 39d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 3a0:	c6 03 00             	movb   $0x0,(%ebx)
}
 3a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3a6:	5b                   	pop    %ebx
 3a7:	5e                   	pop    %esi
 3a8:	5f                   	pop    %edi
 3a9:	5d                   	pop    %ebp
 3aa:	c3                   	ret    
 3ab:	90                   	nop
 3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3b0:	8b 75 08             	mov    0x8(%ebp),%esi
 3b3:	8b 45 08             	mov    0x8(%ebp),%eax
 3b6:	01 de                	add    %ebx,%esi
 3b8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 3ba:	c6 03 00             	movb   $0x0,(%ebx)
}
 3bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3c0:	5b                   	pop    %ebx
 3c1:	5e                   	pop    %esi
 3c2:	5f                   	pop    %edi
 3c3:	5d                   	pop    %ebp
 3c4:	c3                   	ret    
 3c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	56                   	push   %esi
 3d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3d5:	83 ec 08             	sub    $0x8,%esp
 3d8:	6a 00                	push   $0x0
 3da:	ff 75 08             	pushl  0x8(%ebp)
 3dd:	e8 f0 00 00 00       	call   4d2 <open>
  if(fd < 0)
 3e2:	83 c4 10             	add    $0x10,%esp
 3e5:	85 c0                	test   %eax,%eax
 3e7:	78 27                	js     410 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 3e9:	83 ec 08             	sub    $0x8,%esp
 3ec:	ff 75 0c             	pushl  0xc(%ebp)
 3ef:	89 c3                	mov    %eax,%ebx
 3f1:	50                   	push   %eax
 3f2:	e8 f3 00 00 00       	call   4ea <fstat>
  close(fd);
 3f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3fa:	89 c6                	mov    %eax,%esi
  close(fd);
 3fc:	e8 b9 00 00 00       	call   4ba <close>
  return r;
 401:	83 c4 10             	add    $0x10,%esp
}
 404:	8d 65 f8             	lea    -0x8(%ebp),%esp
 407:	89 f0                	mov    %esi,%eax
 409:	5b                   	pop    %ebx
 40a:	5e                   	pop    %esi
 40b:	5d                   	pop    %ebp
 40c:	c3                   	ret    
 40d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 410:	be ff ff ff ff       	mov    $0xffffffff,%esi
 415:	eb ed                	jmp    404 <stat+0x34>
 417:	89 f6                	mov    %esi,%esi
 419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000420 <atoi>:

int
atoi(const char *s)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	53                   	push   %ebx
 424:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 427:	0f be 11             	movsbl (%ecx),%edx
 42a:	8d 42 d0             	lea    -0x30(%edx),%eax
 42d:	3c 09                	cmp    $0x9,%al
  n = 0;
 42f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 434:	77 1f                	ja     455 <atoi+0x35>
 436:	8d 76 00             	lea    0x0(%esi),%esi
 439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 440:	8d 04 80             	lea    (%eax,%eax,4),%eax
 443:	83 c1 01             	add    $0x1,%ecx
 446:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 44a:	0f be 11             	movsbl (%ecx),%edx
 44d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 450:	80 fb 09             	cmp    $0x9,%bl
 453:	76 eb                	jbe    440 <atoi+0x20>
  return n;
}
 455:	5b                   	pop    %ebx
 456:	5d                   	pop    %ebp
 457:	c3                   	ret    
 458:	90                   	nop
 459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000460 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	56                   	push   %esi
 464:	53                   	push   %ebx
 465:	8b 5d 10             	mov    0x10(%ebp),%ebx
 468:	8b 45 08             	mov    0x8(%ebp),%eax
 46b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 46e:	85 db                	test   %ebx,%ebx
 470:	7e 14                	jle    486 <memmove+0x26>
 472:	31 d2                	xor    %edx,%edx
 474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 478:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 47c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 47f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 482:	39 d3                	cmp    %edx,%ebx
 484:	75 f2                	jne    478 <memmove+0x18>
  return vdst;
}
 486:	5b                   	pop    %ebx
 487:	5e                   	pop    %esi
 488:	5d                   	pop    %ebp
 489:	c3                   	ret    

0000048a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 48a:	b8 01 00 00 00       	mov    $0x1,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <exit>:
SYSCALL(exit)
 492:	b8 02 00 00 00       	mov    $0x2,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <wait>:
SYSCALL(wait)
 49a:	b8 03 00 00 00       	mov    $0x3,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <pipe>:
SYSCALL(pipe)
 4a2:	b8 04 00 00 00       	mov    $0x4,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <read>:
SYSCALL(read)
 4aa:	b8 05 00 00 00       	mov    $0x5,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <write>:
SYSCALL(write)
 4b2:	b8 10 00 00 00       	mov    $0x10,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <close>:
SYSCALL(close)
 4ba:	b8 15 00 00 00       	mov    $0x15,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <kill>:
SYSCALL(kill)
 4c2:	b8 06 00 00 00       	mov    $0x6,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <exec>:
SYSCALL(exec)
 4ca:	b8 07 00 00 00       	mov    $0x7,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <open>:
SYSCALL(open)
 4d2:	b8 0f 00 00 00       	mov    $0xf,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <mknod>:
SYSCALL(mknod)
 4da:	b8 11 00 00 00       	mov    $0x11,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <unlink>:
SYSCALL(unlink)
 4e2:	b8 12 00 00 00       	mov    $0x12,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <fstat>:
SYSCALL(fstat)
 4ea:	b8 08 00 00 00       	mov    $0x8,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <link>:
SYSCALL(link)
 4f2:	b8 13 00 00 00       	mov    $0x13,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <mkdir>:
SYSCALL(mkdir)
 4fa:	b8 14 00 00 00       	mov    $0x14,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <chdir>:
SYSCALL(chdir)
 502:	b8 09 00 00 00       	mov    $0x9,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <dup>:
SYSCALL(dup)
 50a:	b8 0a 00 00 00       	mov    $0xa,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <getpid>:
SYSCALL(getpid)
 512:	b8 0b 00 00 00       	mov    $0xb,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <sbrk>:
SYSCALL(sbrk)
 51a:	b8 0c 00 00 00       	mov    $0xc,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <sleep>:
SYSCALL(sleep)
 522:	b8 0d 00 00 00       	mov    $0xd,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <uptime>:
SYSCALL(uptime)
 52a:	b8 0e 00 00 00       	mov    $0xe,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <hello>:
SYSCALL(hello)
 532:	b8 16 00 00 00       	mov    $0x16,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <hello_name>:
SYSCALL(hello_name)
 53a:	b8 17 00 00 00       	mov    $0x17,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <get_num_proc>:
SYSCALL(get_num_proc)
 542:	b8 18 00 00 00       	mov    $0x18,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <get_max_pid>:
SYSCALL(get_max_pid)
 54a:	b8 19 00 00 00       	mov    $0x19,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <get_proc_info>:
SYSCALL(get_proc_info)
 552:	b8 1a 00 00 00       	mov    $0x1a,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <set_prio>:
SYSCALL(set_prio)
 55a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <get_prio>:
SYSCALL(get_prio)
 562:	b8 1c 00 00 00       	mov    $0x1c,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    
 56a:	66 90                	xchg   %ax,%ax
 56c:	66 90                	xchg   %ax,%ax
 56e:	66 90                	xchg   %ax,%ax

00000570 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	56                   	push   %esi
 575:	53                   	push   %ebx
 576:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 579:	85 d2                	test   %edx,%edx
{
 57b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 57e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 580:	79 76                	jns    5f8 <printint+0x88>
 582:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 586:	74 70                	je     5f8 <printint+0x88>
    x = -xx;
 588:	f7 d8                	neg    %eax
    neg = 1;
 58a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 591:	31 f6                	xor    %esi,%esi
 593:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 596:	eb 0a                	jmp    5a2 <printint+0x32>
 598:	90                   	nop
 599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 5a0:	89 fe                	mov    %edi,%esi
 5a2:	31 d2                	xor    %edx,%edx
 5a4:	8d 7e 01             	lea    0x1(%esi),%edi
 5a7:	f7 f1                	div    %ecx
 5a9:	0f b6 92 6c 0a 00 00 	movzbl 0xa6c(%edx),%edx
  }while((x /= base) != 0);
 5b0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 5b2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 5b5:	75 e9                	jne    5a0 <printint+0x30>
  if(neg)
 5b7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 5ba:	85 c0                	test   %eax,%eax
 5bc:	74 08                	je     5c6 <printint+0x56>
    buf[i++] = '-';
 5be:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 5c3:	8d 7e 02             	lea    0x2(%esi),%edi
 5c6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 5ca:	8b 7d c0             	mov    -0x40(%ebp),%edi
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
 5d0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 5d3:	83 ec 04             	sub    $0x4,%esp
 5d6:	83 ee 01             	sub    $0x1,%esi
 5d9:	6a 01                	push   $0x1
 5db:	53                   	push   %ebx
 5dc:	57                   	push   %edi
 5dd:	88 45 d7             	mov    %al,-0x29(%ebp)
 5e0:	e8 cd fe ff ff       	call   4b2 <write>

  while(--i >= 0)
 5e5:	83 c4 10             	add    $0x10,%esp
 5e8:	39 de                	cmp    %ebx,%esi
 5ea:	75 e4                	jne    5d0 <printint+0x60>
    putc(fd, buf[i]);
}
 5ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ef:	5b                   	pop    %ebx
 5f0:	5e                   	pop    %esi
 5f1:	5f                   	pop    %edi
 5f2:	5d                   	pop    %ebp
 5f3:	c3                   	ret    
 5f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5f8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 5ff:	eb 90                	jmp    591 <printint+0x21>
 601:	eb 0d                	jmp    610 <printf>
 603:	90                   	nop
 604:	90                   	nop
 605:	90                   	nop
 606:	90                   	nop
 607:	90                   	nop
 608:	90                   	nop
 609:	90                   	nop
 60a:	90                   	nop
 60b:	90                   	nop
 60c:	90                   	nop
 60d:	90                   	nop
 60e:	90                   	nop
 60f:	90                   	nop

00000610 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	57                   	push   %edi
 614:	56                   	push   %esi
 615:	53                   	push   %ebx
 616:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 619:	8b 75 0c             	mov    0xc(%ebp),%esi
 61c:	0f b6 1e             	movzbl (%esi),%ebx
 61f:	84 db                	test   %bl,%bl
 621:	0f 84 b3 00 00 00    	je     6da <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 627:	8d 45 10             	lea    0x10(%ebp),%eax
 62a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 62d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 62f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 632:	eb 2f                	jmp    663 <printf+0x53>
 634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 638:	83 f8 25             	cmp    $0x25,%eax
 63b:	0f 84 a7 00 00 00    	je     6e8 <printf+0xd8>
  write(fd, &c, 1);
 641:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 644:	83 ec 04             	sub    $0x4,%esp
 647:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 64a:	6a 01                	push   $0x1
 64c:	50                   	push   %eax
 64d:	ff 75 08             	pushl  0x8(%ebp)
 650:	e8 5d fe ff ff       	call   4b2 <write>
 655:	83 c4 10             	add    $0x10,%esp
 658:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 65b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 65f:	84 db                	test   %bl,%bl
 661:	74 77                	je     6da <printf+0xca>
    if(state == 0){
 663:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 665:	0f be cb             	movsbl %bl,%ecx
 668:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 66b:	74 cb                	je     638 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 66d:	83 ff 25             	cmp    $0x25,%edi
 670:	75 e6                	jne    658 <printf+0x48>
      if(c == 'd'){
 672:	83 f8 64             	cmp    $0x64,%eax
 675:	0f 84 05 01 00 00    	je     780 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 67b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 681:	83 f9 70             	cmp    $0x70,%ecx
 684:	74 72                	je     6f8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 686:	83 f8 73             	cmp    $0x73,%eax
 689:	0f 84 99 00 00 00    	je     728 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 68f:	83 f8 63             	cmp    $0x63,%eax
 692:	0f 84 08 01 00 00    	je     7a0 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 698:	83 f8 25             	cmp    $0x25,%eax
 69b:	0f 84 ef 00 00 00    	je     790 <printf+0x180>
  write(fd, &c, 1);
 6a1:	8d 45 e7             	lea    -0x19(%ebp),%eax
 6a4:	83 ec 04             	sub    $0x4,%esp
 6a7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6ab:	6a 01                	push   $0x1
 6ad:	50                   	push   %eax
 6ae:	ff 75 08             	pushl  0x8(%ebp)
 6b1:	e8 fc fd ff ff       	call   4b2 <write>
 6b6:	83 c4 0c             	add    $0xc,%esp
 6b9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 6bc:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 6bf:	6a 01                	push   $0x1
 6c1:	50                   	push   %eax
 6c2:	ff 75 08             	pushl  0x8(%ebp)
 6c5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6c8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 6ca:	e8 e3 fd ff ff       	call   4b2 <write>
  for(i = 0; fmt[i]; i++){
 6cf:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 6d3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6d6:	84 db                	test   %bl,%bl
 6d8:	75 89                	jne    663 <printf+0x53>
    }
  }
}
 6da:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6dd:	5b                   	pop    %ebx
 6de:	5e                   	pop    %esi
 6df:	5f                   	pop    %edi
 6e0:	5d                   	pop    %ebp
 6e1:	c3                   	ret    
 6e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 6e8:	bf 25 00 00 00       	mov    $0x25,%edi
 6ed:	e9 66 ff ff ff       	jmp    658 <printf+0x48>
 6f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 6f8:	83 ec 0c             	sub    $0xc,%esp
 6fb:	b9 10 00 00 00       	mov    $0x10,%ecx
 700:	6a 00                	push   $0x0
 702:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 705:	8b 45 08             	mov    0x8(%ebp),%eax
 708:	8b 17                	mov    (%edi),%edx
 70a:	e8 61 fe ff ff       	call   570 <printint>
        ap++;
 70f:	89 f8                	mov    %edi,%eax
 711:	83 c4 10             	add    $0x10,%esp
      state = 0;
 714:	31 ff                	xor    %edi,%edi
        ap++;
 716:	83 c0 04             	add    $0x4,%eax
 719:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 71c:	e9 37 ff ff ff       	jmp    658 <printf+0x48>
 721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 728:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 72b:	8b 08                	mov    (%eax),%ecx
        ap++;
 72d:	83 c0 04             	add    $0x4,%eax
 730:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 733:	85 c9                	test   %ecx,%ecx
 735:	0f 84 8e 00 00 00    	je     7c9 <printf+0x1b9>
        while(*s != 0){
 73b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 73e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 740:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 742:	84 c0                	test   %al,%al
 744:	0f 84 0e ff ff ff    	je     658 <printf+0x48>
 74a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 74d:	89 de                	mov    %ebx,%esi
 74f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 752:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 755:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 758:	83 ec 04             	sub    $0x4,%esp
          s++;
 75b:	83 c6 01             	add    $0x1,%esi
 75e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 761:	6a 01                	push   $0x1
 763:	57                   	push   %edi
 764:	53                   	push   %ebx
 765:	e8 48 fd ff ff       	call   4b2 <write>
        while(*s != 0){
 76a:	0f b6 06             	movzbl (%esi),%eax
 76d:	83 c4 10             	add    $0x10,%esp
 770:	84 c0                	test   %al,%al
 772:	75 e4                	jne    758 <printf+0x148>
 774:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 777:	31 ff                	xor    %edi,%edi
 779:	e9 da fe ff ff       	jmp    658 <printf+0x48>
 77e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 780:	83 ec 0c             	sub    $0xc,%esp
 783:	b9 0a 00 00 00       	mov    $0xa,%ecx
 788:	6a 01                	push   $0x1
 78a:	e9 73 ff ff ff       	jmp    702 <printf+0xf2>
 78f:	90                   	nop
  write(fd, &c, 1);
 790:	83 ec 04             	sub    $0x4,%esp
 793:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 796:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 799:	6a 01                	push   $0x1
 79b:	e9 21 ff ff ff       	jmp    6c1 <printf+0xb1>
        putc(fd, *ap);
 7a0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 7a3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 7a6:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 7a8:	6a 01                	push   $0x1
        ap++;
 7aa:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 7ad:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 7b0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 7b3:	50                   	push   %eax
 7b4:	ff 75 08             	pushl  0x8(%ebp)
 7b7:	e8 f6 fc ff ff       	call   4b2 <write>
        ap++;
 7bc:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 7bf:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7c2:	31 ff                	xor    %edi,%edi
 7c4:	e9 8f fe ff ff       	jmp    658 <printf+0x48>
          s = "(null)";
 7c9:	bb 64 0a 00 00       	mov    $0xa64,%ebx
        while(*s != 0){
 7ce:	b8 28 00 00 00       	mov    $0x28,%eax
 7d3:	e9 72 ff ff ff       	jmp    74a <printf+0x13a>
 7d8:	66 90                	xchg   %ax,%ax
 7da:	66 90                	xchg   %ax,%ax
 7dc:	66 90                	xchg   %ax,%ax
 7de:	66 90                	xchg   %ax,%ax

000007e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e1:	a1 48 0d 00 00       	mov    0xd48,%eax
{
 7e6:	89 e5                	mov    %esp,%ebp
 7e8:	57                   	push   %edi
 7e9:	56                   	push   %esi
 7ea:	53                   	push   %ebx
 7eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 7ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 7f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7f8:	39 c8                	cmp    %ecx,%eax
 7fa:	8b 10                	mov    (%eax),%edx
 7fc:	73 32                	jae    830 <free+0x50>
 7fe:	39 d1                	cmp    %edx,%ecx
 800:	72 04                	jb     806 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 802:	39 d0                	cmp    %edx,%eax
 804:	72 32                	jb     838 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 806:	8b 73 fc             	mov    -0x4(%ebx),%esi
 809:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 80c:	39 fa                	cmp    %edi,%edx
 80e:	74 30                	je     840 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 810:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 813:	8b 50 04             	mov    0x4(%eax),%edx
 816:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 819:	39 f1                	cmp    %esi,%ecx
 81b:	74 3a                	je     857 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 81d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 81f:	a3 48 0d 00 00       	mov    %eax,0xd48
}
 824:	5b                   	pop    %ebx
 825:	5e                   	pop    %esi
 826:	5f                   	pop    %edi
 827:	5d                   	pop    %ebp
 828:	c3                   	ret    
 829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 830:	39 d0                	cmp    %edx,%eax
 832:	72 04                	jb     838 <free+0x58>
 834:	39 d1                	cmp    %edx,%ecx
 836:	72 ce                	jb     806 <free+0x26>
{
 838:	89 d0                	mov    %edx,%eax
 83a:	eb bc                	jmp    7f8 <free+0x18>
 83c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 840:	03 72 04             	add    0x4(%edx),%esi
 843:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 846:	8b 10                	mov    (%eax),%edx
 848:	8b 12                	mov    (%edx),%edx
 84a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 84d:	8b 50 04             	mov    0x4(%eax),%edx
 850:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 853:	39 f1                	cmp    %esi,%ecx
 855:	75 c6                	jne    81d <free+0x3d>
    p->s.size += bp->s.size;
 857:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 85a:	a3 48 0d 00 00       	mov    %eax,0xd48
    p->s.size += bp->s.size;
 85f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 862:	8b 53 f8             	mov    -0x8(%ebx),%edx
 865:	89 10                	mov    %edx,(%eax)
}
 867:	5b                   	pop    %ebx
 868:	5e                   	pop    %esi
 869:	5f                   	pop    %edi
 86a:	5d                   	pop    %ebp
 86b:	c3                   	ret    
 86c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000870 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 870:	55                   	push   %ebp
 871:	89 e5                	mov    %esp,%ebp
 873:	57                   	push   %edi
 874:	56                   	push   %esi
 875:	53                   	push   %ebx
 876:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 879:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 87c:	8b 15 48 0d 00 00    	mov    0xd48,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 882:	8d 78 07             	lea    0x7(%eax),%edi
 885:	c1 ef 03             	shr    $0x3,%edi
 888:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 88b:	85 d2                	test   %edx,%edx
 88d:	0f 84 9d 00 00 00    	je     930 <malloc+0xc0>
 893:	8b 02                	mov    (%edx),%eax
 895:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 898:	39 cf                	cmp    %ecx,%edi
 89a:	76 6c                	jbe    908 <malloc+0x98>
 89c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 8a2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8a7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 8aa:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 8b1:	eb 0e                	jmp    8c1 <malloc+0x51>
 8b3:	90                   	nop
 8b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8ba:	8b 48 04             	mov    0x4(%eax),%ecx
 8bd:	39 f9                	cmp    %edi,%ecx
 8bf:	73 47                	jae    908 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8c1:	39 05 48 0d 00 00    	cmp    %eax,0xd48
 8c7:	89 c2                	mov    %eax,%edx
 8c9:	75 ed                	jne    8b8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 8cb:	83 ec 0c             	sub    $0xc,%esp
 8ce:	56                   	push   %esi
 8cf:	e8 46 fc ff ff       	call   51a <sbrk>
  if(p == (char*)-1)
 8d4:	83 c4 10             	add    $0x10,%esp
 8d7:	83 f8 ff             	cmp    $0xffffffff,%eax
 8da:	74 1c                	je     8f8 <malloc+0x88>
  hp->s.size = nu;
 8dc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8df:	83 ec 0c             	sub    $0xc,%esp
 8e2:	83 c0 08             	add    $0x8,%eax
 8e5:	50                   	push   %eax
 8e6:	e8 f5 fe ff ff       	call   7e0 <free>
  return freep;
 8eb:	8b 15 48 0d 00 00    	mov    0xd48,%edx
      if((p = morecore(nunits)) == 0)
 8f1:	83 c4 10             	add    $0x10,%esp
 8f4:	85 d2                	test   %edx,%edx
 8f6:	75 c0                	jne    8b8 <malloc+0x48>
        return 0;
  }
}
 8f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8fb:	31 c0                	xor    %eax,%eax
}
 8fd:	5b                   	pop    %ebx
 8fe:	5e                   	pop    %esi
 8ff:	5f                   	pop    %edi
 900:	5d                   	pop    %ebp
 901:	c3                   	ret    
 902:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 908:	39 cf                	cmp    %ecx,%edi
 90a:	74 54                	je     960 <malloc+0xf0>
        p->s.size -= nunits;
 90c:	29 f9                	sub    %edi,%ecx
 90e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 911:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 914:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 917:	89 15 48 0d 00 00    	mov    %edx,0xd48
}
 91d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 920:	83 c0 08             	add    $0x8,%eax
}
 923:	5b                   	pop    %ebx
 924:	5e                   	pop    %esi
 925:	5f                   	pop    %edi
 926:	5d                   	pop    %ebp
 927:	c3                   	ret    
 928:	90                   	nop
 929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 930:	c7 05 48 0d 00 00 4c 	movl   $0xd4c,0xd48
 937:	0d 00 00 
 93a:	c7 05 4c 0d 00 00 4c 	movl   $0xd4c,0xd4c
 941:	0d 00 00 
    base.s.size = 0;
 944:	b8 4c 0d 00 00       	mov    $0xd4c,%eax
 949:	c7 05 50 0d 00 00 00 	movl   $0x0,0xd50
 950:	00 00 00 
 953:	e9 44 ff ff ff       	jmp    89c <malloc+0x2c>
 958:	90                   	nop
 959:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 960:	8b 08                	mov    (%eax),%ecx
 962:	89 0a                	mov    %ecx,(%edx)
 964:	eb b1                	jmp    917 <malloc+0xa7>
