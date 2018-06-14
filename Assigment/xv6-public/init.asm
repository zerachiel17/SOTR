
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	53                   	push   %ebx
   7:	83 ec 1c             	sub    $0x1c,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  11:	00 
  12:	c7 04 24 0e 08 00 00 	movl   $0x80e,(%esp)
  19:	e8 6a 03 00 00       	call   388 <open>
  1e:	85 c0                	test   %eax,%eax
  20:	0f 88 b7 00 00 00    	js     dd <main+0xdd>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  26:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  2d:	e8 8e 03 00 00       	call   3c0 <dup>
  dup(0);  // stderr
  32:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  39:	e8 82 03 00 00       	call   3c0 <dup>
  3e:	66 90                	xchg   %ax,%ax

  for(;;){
    printf(1, "init: starting sh\n");
  40:	c7 44 24 04 16 08 00 	movl   $0x816,0x4(%esp)
  47:	00 
  48:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  4f:	e8 3c 04 00 00       	call   490 <printf>
    pid = fork();
  54:	e8 e7 02 00 00       	call   340 <fork>
    if(pid < 0){
  59:	83 f8 00             	cmp    $0x0,%eax
  dup(0);  // stdout
  dup(0);  // stderr

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
  5c:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  5e:	7c 30                	jl     90 <main+0x90>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  60:	74 4e                	je     b0 <main+0xb0>
  62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  68:	e8 e3 02 00 00       	call   350 <wait>
  6d:	85 c0                	test   %eax,%eax
  6f:	90                   	nop
  70:	78 ce                	js     40 <main+0x40>
  72:	39 c3                	cmp    %eax,%ebx
  74:	74 ca                	je     40 <main+0x40>
      printf(1, "zombie!\n");
  76:	c7 44 24 04 55 08 00 	movl   $0x855,0x4(%esp)
  7d:	00 
  7e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  85:	e8 06 04 00 00       	call   490 <printf>
  8a:	eb d6                	jmp    62 <main+0x62>
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
  90:	c7 44 24 04 29 08 00 	movl   $0x829,0x4(%esp)
  97:	00 
  98:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9f:	e8 ec 03 00 00       	call   490 <printf>
      exit();
  a4:	e8 9f 02 00 00       	call   348 <exit>
  a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
    if(pid == 0){
      exec("sh", argv);
  b0:	c7 44 24 04 78 08 00 	movl   $0x878,0x4(%esp)
  b7:	00 
  b8:	c7 04 24 3c 08 00 00 	movl   $0x83c,(%esp)
  bf:	e8 bc 02 00 00       	call   380 <exec>
      printf(1, "init: exec sh failed\n");
  c4:	c7 44 24 04 3f 08 00 	movl   $0x83f,0x4(%esp)
  cb:	00 
  cc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d3:	e8 b8 03 00 00       	call   490 <printf>
      exit();
  d8:	e8 6b 02 00 00       	call   348 <exit>
main(void)
{
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    mknod("console", 1, 1);
  dd:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  e4:	00 
  e5:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  ec:	00 
  ed:	c7 04 24 0e 08 00 00 	movl   $0x80e,(%esp)
  f4:	e8 97 02 00 00       	call   390 <mknod>
    open("console", O_RDWR);
  f9:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
 100:	00 
 101:	c7 04 24 0e 08 00 00 	movl   $0x80e,(%esp)
 108:	e8 7b 02 00 00       	call   388 <open>
 10d:	e9 14 ff ff ff       	jmp    26 <main+0x26>
 112:	90                   	nop
 113:	90                   	nop
 114:	90                   	nop
 115:	90                   	nop
 116:	90                   	nop
 117:	90                   	nop
 118:	90                   	nop
 119:	90                   	nop
 11a:	90                   	nop
 11b:	90                   	nop
 11c:	90                   	nop
 11d:	90                   	nop
 11e:	90                   	nop
 11f:	90                   	nop

00000120 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 120:	55                   	push   %ebp
 121:	31 d2                	xor    %edx,%edx
 123:	89 e5                	mov    %esp,%ebp
 125:	8b 45 08             	mov    0x8(%ebp),%eax
 128:	53                   	push   %ebx
 129:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 130:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 134:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 137:	83 c2 01             	add    $0x1,%edx
 13a:	84 c9                	test   %cl,%cl
 13c:	75 f2                	jne    130 <strcpy+0x10>
    ;
  return os;
}
 13e:	5b                   	pop    %ebx
 13f:	5d                   	pop    %ebp
 140:	c3                   	ret    
 141:	eb 0d                	jmp    150 <strcmp>
 143:	90                   	nop
 144:	90                   	nop
 145:	90                   	nop
 146:	90                   	nop
 147:	90                   	nop
 148:	90                   	nop
 149:	90                   	nop
 14a:	90                   	nop
 14b:	90                   	nop
 14c:	90                   	nop
 14d:	90                   	nop
 14e:	90                   	nop
 14f:	90                   	nop

00000150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 4d 08             	mov    0x8(%ebp),%ecx
 157:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 15a:	0f b6 01             	movzbl (%ecx),%eax
 15d:	84 c0                	test   %al,%al
 15f:	75 14                	jne    175 <strcmp+0x25>
 161:	eb 25                	jmp    188 <strcmp+0x38>
 163:	90                   	nop
 164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
 168:	83 c1 01             	add    $0x1,%ecx
 16b:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 16e:	0f b6 01             	movzbl (%ecx),%eax
 171:	84 c0                	test   %al,%al
 173:	74 13                	je     188 <strcmp+0x38>
 175:	0f b6 1a             	movzbl (%edx),%ebx
 178:	38 d8                	cmp    %bl,%al
 17a:	74 ec                	je     168 <strcmp+0x18>
 17c:	0f b6 db             	movzbl %bl,%ebx
 17f:	0f b6 c0             	movzbl %al,%eax
 182:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 184:	5b                   	pop    %ebx
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    
 187:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 188:	0f b6 1a             	movzbl (%edx),%ebx
 18b:	31 c0                	xor    %eax,%eax
 18d:	0f b6 db             	movzbl %bl,%ebx
 190:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 192:	5b                   	pop    %ebx
 193:	5d                   	pop    %ebp
 194:	c3                   	ret    
 195:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001a0 <strlen>:

uint
strlen(char *s)
{
 1a0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 1a1:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 1a3:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
 1a5:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 1a7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1aa:	80 39 00             	cmpb   $0x0,(%ecx)
 1ad:	74 0c                	je     1bb <strlen+0x1b>
 1af:	90                   	nop
 1b0:	83 c2 01             	add    $0x1,%edx
 1b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1b7:	89 d0                	mov    %edx,%eax
 1b9:	75 f5                	jne    1b0 <strlen+0x10>
    ;
  return n;
}
 1bb:	5d                   	pop    %ebp
 1bc:	c3                   	ret    
 1bd:	8d 76 00             	lea    0x0(%esi),%esi

000001c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 55 08             	mov    0x8(%ebp),%edx
 1c6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cd:	89 d7                	mov    %edx,%edi
 1cf:	fc                   	cld    
 1d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1d2:	89 d0                	mov    %edx,%eax
 1d4:	5f                   	pop    %edi
 1d5:	5d                   	pop    %ebp
 1d6:	c3                   	ret    
 1d7:	89 f6                	mov    %esi,%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001e0 <strchr>:

char*
strchr(const char *s, char c)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1ea:	0f b6 10             	movzbl (%eax),%edx
 1ed:	84 d2                	test   %dl,%dl
 1ef:	75 11                	jne    202 <strchr+0x22>
 1f1:	eb 15                	jmp    208 <strchr+0x28>
 1f3:	90                   	nop
 1f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1f8:	83 c0 01             	add    $0x1,%eax
 1fb:	0f b6 10             	movzbl (%eax),%edx
 1fe:	84 d2                	test   %dl,%dl
 200:	74 06                	je     208 <strchr+0x28>
    if(*s == c)
 202:	38 ca                	cmp    %cl,%dl
 204:	75 f2                	jne    1f8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 206:	5d                   	pop    %ebp
 207:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 208:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*)s;
  return 0;
}
 20a:	5d                   	pop    %ebp
 20b:	90                   	nop
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 210:	c3                   	ret    
 211:	eb 0d                	jmp    220 <atoi>
 213:	90                   	nop
 214:	90                   	nop
 215:	90                   	nop
 216:	90                   	nop
 217:	90                   	nop
 218:	90                   	nop
 219:	90                   	nop
 21a:	90                   	nop
 21b:	90                   	nop
 21c:	90                   	nop
 21d:	90                   	nop
 21e:	90                   	nop
 21f:	90                   	nop

00000220 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 220:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 221:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 223:	89 e5                	mov    %esp,%ebp
 225:	8b 4d 08             	mov    0x8(%ebp),%ecx
 228:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 229:	0f b6 11             	movzbl (%ecx),%edx
 22c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 22f:	80 fb 09             	cmp    $0x9,%bl
 232:	77 1c                	ja     250 <atoi+0x30>
 234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 238:	0f be d2             	movsbl %dl,%edx
 23b:	83 c1 01             	add    $0x1,%ecx
 23e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 241:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 245:	0f b6 11             	movzbl (%ecx),%edx
 248:	8d 5a d0             	lea    -0x30(%edx),%ebx
 24b:	80 fb 09             	cmp    $0x9,%bl
 24e:	76 e8                	jbe    238 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 250:	5b                   	pop    %ebx
 251:	5d                   	pop    %ebp
 252:	c3                   	ret    
 253:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	56                   	push   %esi
 264:	8b 45 08             	mov    0x8(%ebp),%eax
 267:	53                   	push   %ebx
 268:	8b 5d 10             	mov    0x10(%ebp),%ebx
 26b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 26e:	85 db                	test   %ebx,%ebx
 270:	7e 14                	jle    286 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 272:	31 d2                	xor    %edx,%edx
 274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 278:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 27c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 27f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 282:	39 da                	cmp    %ebx,%edx
 284:	75 f2                	jne    278 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 286:	5b                   	pop    %ebx
 287:	5e                   	pop    %esi
 288:	5d                   	pop    %ebp
 289:	c3                   	ret    
 28a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000290 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 296:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
 299:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 29c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 29f:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2ab:	00 
 2ac:	89 04 24             	mov    %eax,(%esp)
 2af:	e8 d4 00 00 00       	call   388 <open>
  if(fd < 0)
 2b4:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 2b8:	78 19                	js     2d3 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 2ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 2bd:	89 1c 24             	mov    %ebx,(%esp)
 2c0:	89 44 24 04          	mov    %eax,0x4(%esp)
 2c4:	e8 d7 00 00 00       	call   3a0 <fstat>
  close(fd);
 2c9:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 2cc:	89 c6                	mov    %eax,%esi
  close(fd);
 2ce:	e8 9d 00 00 00       	call   370 <close>
  return r;
}
 2d3:	89 f0                	mov    %esi,%eax
 2d5:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 2d8:	8b 75 fc             	mov    -0x4(%ebp),%esi
 2db:	89 ec                	mov    %ebp,%esp
 2dd:	5d                   	pop    %ebp
 2de:	c3                   	ret    
 2df:	90                   	nop

000002e0 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	56                   	push   %esi
 2e5:	31 f6                	xor    %esi,%esi
 2e7:	53                   	push   %ebx
 2e8:	83 ec 2c             	sub    $0x2c,%esp
 2eb:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ee:	eb 06                	jmp    2f6 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 2f0:	3c 0a                	cmp    $0xa,%al
 2f2:	74 39                	je     32d <gets+0x4d>
 2f4:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f6:	8d 5e 01             	lea    0x1(%esi),%ebx
 2f9:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2fc:	7d 31                	jge    32f <gets+0x4f>
    cc = read(0, &c, 1);
 2fe:	8d 45 e7             	lea    -0x19(%ebp),%eax
 301:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 308:	00 
 309:	89 44 24 04          	mov    %eax,0x4(%esp)
 30d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 314:	e8 47 00 00 00       	call   360 <read>
    if(cc < 1)
 319:	85 c0                	test   %eax,%eax
 31b:	7e 12                	jle    32f <gets+0x4f>
      break;
    buf[i++] = c;
 31d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 321:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 325:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 329:	3c 0d                	cmp    $0xd,%al
 32b:	75 c3                	jne    2f0 <gets+0x10>
 32d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 32f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 333:	89 f8                	mov    %edi,%eax
 335:	83 c4 2c             	add    $0x2c,%esp
 338:	5b                   	pop    %ebx
 339:	5e                   	pop    %esi
 33a:	5f                   	pop    %edi
 33b:	5d                   	pop    %ebp
 33c:	c3                   	ret    
 33d:	90                   	nop
 33e:	90                   	nop
 33f:	90                   	nop

00000340 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 340:	b8 01 00 00 00       	mov    $0x1,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <exit>:
SYSCALL(exit)
 348:	b8 02 00 00 00       	mov    $0x2,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <wait>:
SYSCALL(wait)
 350:	b8 03 00 00 00       	mov    $0x3,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <pipe>:
SYSCALL(pipe)
 358:	b8 04 00 00 00       	mov    $0x4,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <read>:
SYSCALL(read)
 360:	b8 05 00 00 00       	mov    $0x5,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <write>:
SYSCALL(write)
 368:	b8 10 00 00 00       	mov    $0x10,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <close>:
SYSCALL(close)
 370:	b8 15 00 00 00       	mov    $0x15,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <kill>:
SYSCALL(kill)
 378:	b8 06 00 00 00       	mov    $0x6,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <exec>:
SYSCALL(exec)
 380:	b8 07 00 00 00       	mov    $0x7,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <open>:
SYSCALL(open)
 388:	b8 0f 00 00 00       	mov    $0xf,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <mknod>:
SYSCALL(mknod)
 390:	b8 11 00 00 00       	mov    $0x11,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <unlink>:
SYSCALL(unlink)
 398:	b8 12 00 00 00       	mov    $0x12,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <fstat>:
SYSCALL(fstat)
 3a0:	b8 08 00 00 00       	mov    $0x8,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <link>:
SYSCALL(link)
 3a8:	b8 13 00 00 00       	mov    $0x13,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <mkdir>:
SYSCALL(mkdir)
 3b0:	b8 14 00 00 00       	mov    $0x14,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <chdir>:
SYSCALL(chdir)
 3b8:	b8 09 00 00 00       	mov    $0x9,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <dup>:
SYSCALL(dup)
 3c0:	b8 0a 00 00 00       	mov    $0xa,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <getpid>:
SYSCALL(getpid)
 3c8:	b8 0b 00 00 00       	mov    $0xb,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <sbrk>:
SYSCALL(sbrk)
 3d0:	b8 0c 00 00 00       	mov    $0xc,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <sleep>:
SYSCALL(sleep)
 3d8:	b8 0d 00 00 00       	mov    $0xd,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <uptime>:
SYSCALL(uptime)
 3e0:	b8 0e 00 00 00       	mov    $0xe,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    
 3e8:	90                   	nop
 3e9:	90                   	nop
 3ea:	90                   	nop
 3eb:	90                   	nop
 3ec:	90                   	nop
 3ed:	90                   	nop
 3ee:	90                   	nop
 3ef:	90                   	nop

000003f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	89 cf                	mov    %ecx,%edi
 3f6:	56                   	push   %esi
 3f7:	89 c6                	mov    %eax,%esi
 3f9:	53                   	push   %ebx
 3fa:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3fd:	8b 4d 08             	mov    0x8(%ebp),%ecx
 400:	85 c9                	test   %ecx,%ecx
 402:	74 04                	je     408 <printint+0x18>
 404:	85 d2                	test   %edx,%edx
 406:	78 70                	js     478 <printint+0x88>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 408:	89 d0                	mov    %edx,%eax
 40a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 411:	31 c9                	xor    %ecx,%ecx
 413:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 416:	66 90                	xchg   %ax,%ax
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 418:	31 d2                	xor    %edx,%edx
 41a:	f7 f7                	div    %edi
 41c:	0f b6 92 65 08 00 00 	movzbl 0x865(%edx),%edx
 423:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 426:	83 c1 01             	add    $0x1,%ecx
  }while((x /= base) != 0);
 429:	85 c0                	test   %eax,%eax
 42b:	75 eb                	jne    418 <printint+0x28>
  if(neg)
 42d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 430:	85 c0                	test   %eax,%eax
 432:	74 08                	je     43c <printint+0x4c>
    buf[i++] = '-';
 434:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 439:	83 c1 01             	add    $0x1,%ecx

  while(--i >= 0)
 43c:	8d 79 ff             	lea    -0x1(%ecx),%edi
 43f:	01 fb                	add    %edi,%ebx
 441:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 448:	0f b6 03             	movzbl (%ebx),%eax
 44b:	83 ef 01             	sub    $0x1,%edi
 44e:	83 eb 01             	sub    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 451:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 458:	00 
 459:	89 34 24             	mov    %esi,(%esp)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 45c:	88 45 e7             	mov    %al,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 45f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 462:	89 44 24 04          	mov    %eax,0x4(%esp)
 466:	e8 fd fe ff ff       	call   368 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 46b:	83 ff ff             	cmp    $0xffffffff,%edi
 46e:	75 d8                	jne    448 <printint+0x58>
    putc(fd, buf[i]);
}
 470:	83 c4 4c             	add    $0x4c,%esp
 473:	5b                   	pop    %ebx
 474:	5e                   	pop    %esi
 475:	5f                   	pop    %edi
 476:	5d                   	pop    %ebp
 477:	c3                   	ret    
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 478:	89 d0                	mov    %edx,%eax
 47a:	f7 d8                	neg    %eax
 47c:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 483:	eb 8c                	jmp    411 <printint+0x21>
 485:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000490 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	56                   	push   %esi
 495:	53                   	push   %ebx
 496:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 499:	8b 45 0c             	mov    0xc(%ebp),%eax
 49c:	0f b6 10             	movzbl (%eax),%edx
 49f:	84 d2                	test   %dl,%dl
 4a1:	0f 84 c9 00 00 00    	je     570 <printf+0xe0>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4a7:	8d 4d 10             	lea    0x10(%ebp),%ecx
 4aa:	31 ff                	xor    %edi,%edi
 4ac:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 4af:	31 db                	xor    %ebx,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4b1:	8d 75 e7             	lea    -0x19(%ebp),%esi
 4b4:	eb 1e                	jmp    4d4 <printf+0x44>
 4b6:	66 90                	xchg   %ax,%ax
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4b8:	83 fa 25             	cmp    $0x25,%edx
 4bb:	0f 85 b7 00 00 00    	jne    578 <printf+0xe8>
 4c1:	66 bf 25 00          	mov    $0x25,%di
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4c5:	83 c3 01             	add    $0x1,%ebx
 4c8:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 4cc:	84 d2                	test   %dl,%dl
 4ce:	0f 84 9c 00 00 00    	je     570 <printf+0xe0>
    c = fmt[i] & 0xff;
    if(state == 0){
 4d4:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 4d6:	0f b6 d2             	movzbl %dl,%edx
    if(state == 0){
 4d9:	74 dd                	je     4b8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4db:	83 ff 25             	cmp    $0x25,%edi
 4de:	75 e5                	jne    4c5 <printf+0x35>
      if(c == 'd'){
 4e0:	83 fa 64             	cmp    $0x64,%edx
 4e3:	0f 84 57 01 00 00    	je     640 <printf+0x1b0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4e9:	83 fa 70             	cmp    $0x70,%edx
 4ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4f0:	0f 84 aa 00 00 00    	je     5a0 <printf+0x110>
 4f6:	83 fa 78             	cmp    $0x78,%edx
 4f9:	0f 84 a1 00 00 00    	je     5a0 <printf+0x110>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4ff:	83 fa 73             	cmp    $0x73,%edx
 502:	0f 84 c0 00 00 00    	je     5c8 <printf+0x138>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 508:	83 fa 63             	cmp    $0x63,%edx
 50b:	90                   	nop
 50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 510:	0f 84 52 01 00 00    	je     668 <printf+0x1d8>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 516:	83 fa 25             	cmp    $0x25,%edx
 519:	0f 84 f9 00 00 00    	je     618 <printf+0x188>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 51f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 522:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 525:	31 ff                	xor    %edi,%edi
 527:	89 55 cc             	mov    %edx,-0x34(%ebp)
 52a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 52e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 535:	00 
 536:	89 0c 24             	mov    %ecx,(%esp)
 539:	89 74 24 04          	mov    %esi,0x4(%esp)
 53d:	e8 26 fe ff ff       	call   368 <write>
 542:	8b 55 cc             	mov    -0x34(%ebp),%edx
 545:	8b 45 08             	mov    0x8(%ebp),%eax
 548:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 54f:	00 
 550:	89 74 24 04          	mov    %esi,0x4(%esp)
 554:	88 55 e7             	mov    %dl,-0x19(%ebp)
 557:	89 04 24             	mov    %eax,(%esp)
 55a:	e8 09 fe ff ff       	call   368 <write>
 55f:	8b 45 0c             	mov    0xc(%ebp),%eax
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 562:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 566:	84 d2                	test   %dl,%dl
 568:	0f 85 66 ff ff ff    	jne    4d4 <printf+0x44>
 56e:	66 90                	xchg   %ax,%ax
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 570:	83 c4 3c             	add    $0x3c,%esp
 573:	5b                   	pop    %ebx
 574:	5e                   	pop    %esi
 575:	5f                   	pop    %edi
 576:	5d                   	pop    %ebp
 577:	c3                   	ret    
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 578:	8b 45 08             	mov    0x8(%ebp),%eax
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 57b:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 57e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 585:	00 
 586:	89 74 24 04          	mov    %esi,0x4(%esp)
 58a:	89 04 24             	mov    %eax,(%esp)
 58d:	e8 d6 fd ff ff       	call   368 <write>
 592:	8b 45 0c             	mov    0xc(%ebp),%eax
 595:	e9 2b ff ff ff       	jmp    4c5 <printf+0x35>
 59a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 5a0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5a3:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
 5a8:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 5aa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 5b1:	8b 10                	mov    (%eax),%edx
 5b3:	8b 45 08             	mov    0x8(%ebp),%eax
 5b6:	e8 35 fe ff ff       	call   3f0 <printint>
 5bb:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 5be:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5c2:	e9 fe fe ff ff       	jmp    4c5 <printf+0x35>
 5c7:	90                   	nop
      } else if(c == 's'){
        s = (char*)*ap;
 5c8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 5cb:	8b 3a                	mov    (%edx),%edi
        ap++;
 5cd:	83 c2 04             	add    $0x4,%edx
 5d0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        if(s == 0)
 5d3:	85 ff                	test   %edi,%edi
 5d5:	0f 84 ba 00 00 00    	je     695 <printf+0x205>
          s = "(null)";
        while(*s != 0){
 5db:	0f b6 17             	movzbl (%edi),%edx
 5de:	84 d2                	test   %dl,%dl
 5e0:	74 2d                	je     60f <printf+0x17f>
 5e2:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
          putc(fd, *s);
          s++;
 5e8:	83 c7 01             	add    $0x1,%edi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5eb:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5ee:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5f5:	00 
 5f6:	89 74 24 04          	mov    %esi,0x4(%esp)
 5fa:	89 1c 24             	mov    %ebx,(%esp)
 5fd:	e8 66 fd ff ff       	call   368 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 602:	0f b6 17             	movzbl (%edi),%edx
 605:	84 d2                	test   %dl,%dl
 607:	75 df                	jne    5e8 <printf+0x158>
 609:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 60c:	8b 45 0c             	mov    0xc(%ebp),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 60f:	31 ff                	xor    %edi,%edi
 611:	e9 af fe ff ff       	jmp    4c5 <printf+0x35>
 616:	66 90                	xchg   %ax,%ax
 618:	8b 55 08             	mov    0x8(%ebp),%edx
 61b:	31 ff                	xor    %edi,%edi
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 61d:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 621:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 628:	00 
 629:	89 74 24 04          	mov    %esi,0x4(%esp)
 62d:	89 14 24             	mov    %edx,(%esp)
 630:	e8 33 fd ff ff       	call   368 <write>
 635:	8b 45 0c             	mov    0xc(%ebp),%eax
 638:	e9 88 fe ff ff       	jmp    4c5 <printf+0x35>
 63d:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 640:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 643:	b9 0a 00 00 00       	mov    $0xa,%ecx
        ap++;
 648:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 64b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 652:	8b 10                	mov    (%eax),%edx
 654:	8b 45 08             	mov    0x8(%ebp),%eax
 657:	e8 94 fd ff ff       	call   3f0 <printint>
 65c:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 65f:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 663:	e9 5d fe ff ff       	jmp    4c5 <printf+0x35>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 668:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
        putc(fd, *ap);
        ap++;
 66b:	31 ff                	xor    %edi,%edi
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 66d:	8b 01                	mov    (%ecx),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 66f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 676:	00 
 677:	89 74 24 04          	mov    %esi,0x4(%esp)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 67b:	88 45 e7             	mov    %al,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 67e:	8b 45 08             	mov    0x8(%ebp),%eax
 681:	89 04 24             	mov    %eax,(%esp)
 684:	e8 df fc ff ff       	call   368 <write>
 689:	8b 45 0c             	mov    0xc(%ebp),%eax
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
 68c:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 690:	e9 30 fe ff ff       	jmp    4c5 <printf+0x35>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
 695:	bf 5e 08 00 00       	mov    $0x85e,%edi
 69a:	e9 3c ff ff ff       	jmp    5db <printf+0x14b>
 69f:	90                   	nop

000006a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6a1:	a1 88 08 00 00       	mov    0x888,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 6a6:	89 e5                	mov    %esp,%ebp
 6a8:	57                   	push   %edi
 6a9:	56                   	push   %esi
 6aa:	53                   	push   %ebx
 6ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b1:	39 c8                	cmp    %ecx,%eax
 6b3:	73 1d                	jae    6d2 <free+0x32>
 6b5:	8d 76 00             	lea    0x0(%esi),%esi
 6b8:	8b 10                	mov    (%eax),%edx
 6ba:	39 d1                	cmp    %edx,%ecx
 6bc:	72 1a                	jb     6d8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6be:	39 d0                	cmp    %edx,%eax
 6c0:	72 08                	jb     6ca <free+0x2a>
 6c2:	39 c8                	cmp    %ecx,%eax
 6c4:	72 12                	jb     6d8 <free+0x38>
 6c6:	39 d1                	cmp    %edx,%ecx
 6c8:	72 0e                	jb     6d8 <free+0x38>
 6ca:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6cc:	39 c8                	cmp    %ecx,%eax
 6ce:	66 90                	xchg   %ax,%ax
 6d0:	72 e6                	jb     6b8 <free+0x18>
 6d2:	8b 10                	mov    (%eax),%edx
 6d4:	eb e8                	jmp    6be <free+0x1e>
 6d6:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6d8:	8b 71 04             	mov    0x4(%ecx),%esi
 6db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6de:	39 d7                	cmp    %edx,%edi
 6e0:	74 19                	je     6fb <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6e2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6e5:	8b 50 04             	mov    0x4(%eax),%edx
 6e8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6eb:	39 ce                	cmp    %ecx,%esi
 6ed:	74 23                	je     712 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6ef:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6f1:	a3 88 08 00 00       	mov    %eax,0x888
}
 6f6:	5b                   	pop    %ebx
 6f7:	5e                   	pop    %esi
 6f8:	5f                   	pop    %edi
 6f9:	5d                   	pop    %ebp
 6fa:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 6fb:	03 72 04             	add    0x4(%edx),%esi
 6fe:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 701:	8b 10                	mov    (%eax),%edx
 703:	8b 12                	mov    (%edx),%edx
 705:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 708:	8b 50 04             	mov    0x4(%eax),%edx
 70b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 70e:	39 ce                	cmp    %ecx,%esi
 710:	75 dd                	jne    6ef <free+0x4f>
    p->s.size += bp->s.size;
 712:	03 51 04             	add    0x4(%ecx),%edx
 715:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 718:	8b 53 f8             	mov    -0x8(%ebx),%edx
 71b:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 71d:	a3 88 08 00 00       	mov    %eax,0x888
}
 722:	5b                   	pop    %ebx
 723:	5e                   	pop    %esi
 724:	5f                   	pop    %edi
 725:	5d                   	pop    %ebp
 726:	c3                   	ret    
 727:	89 f6                	mov    %esi,%esi
 729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000730 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	57                   	push   %edi
 734:	56                   	push   %esi
 735:	53                   	push   %ebx
 736:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 739:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 73c:	8b 0d 88 08 00 00    	mov    0x888,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 742:	83 c3 07             	add    $0x7,%ebx
 745:	c1 eb 03             	shr    $0x3,%ebx
 748:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 74b:	85 c9                	test   %ecx,%ecx
 74d:	0f 84 93 00 00 00    	je     7e6 <malloc+0xb6>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 753:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 755:	8b 50 04             	mov    0x4(%eax),%edx
 758:	39 d3                	cmp    %edx,%ebx
 75a:	76 1f                	jbe    77b <malloc+0x4b>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 75c:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 763:	90                   	nop
 764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
 768:	3b 05 88 08 00 00    	cmp    0x888,%eax
 76e:	74 30                	je     7a0 <malloc+0x70>
 770:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 772:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 774:	8b 50 04             	mov    0x4(%eax),%edx
 777:	39 d3                	cmp    %edx,%ebx
 779:	77 ed                	ja     768 <malloc+0x38>
      if(p->s.size == nunits)
 77b:	39 d3                	cmp    %edx,%ebx
 77d:	74 61                	je     7e0 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 77f:	29 da                	sub    %ebx,%edx
 781:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 784:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 787:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 78a:	89 0d 88 08 00 00    	mov    %ecx,0x888
      return (void*)(p + 1);
 790:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 793:	83 c4 1c             	add    $0x1c,%esp
 796:	5b                   	pop    %ebx
 797:	5e                   	pop    %esi
 798:	5f                   	pop    %edi
 799:	5d                   	pop    %ebp
 79a:	c3                   	ret    
 79b:	90                   	nop
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 7a0:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
 7a6:	b8 00 80 00 00       	mov    $0x8000,%eax
 7ab:	bf 00 10 00 00       	mov    $0x1000,%edi
 7b0:	76 04                	jbe    7b6 <malloc+0x86>
 7b2:	89 f0                	mov    %esi,%eax
 7b4:	89 df                	mov    %ebx,%edi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 7b6:	89 04 24             	mov    %eax,(%esp)
 7b9:	e8 12 fc ff ff       	call   3d0 <sbrk>
  if(p == (char*)-1)
 7be:	83 f8 ff             	cmp    $0xffffffff,%eax
 7c1:	74 18                	je     7db <malloc+0xab>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7c3:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 7c6:	83 c0 08             	add    $0x8,%eax
 7c9:	89 04 24             	mov    %eax,(%esp)
 7cc:	e8 cf fe ff ff       	call   6a0 <free>
  return freep;
 7d1:	8b 0d 88 08 00 00    	mov    0x888,%ecx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 7d7:	85 c9                	test   %ecx,%ecx
 7d9:	75 97                	jne    772 <malloc+0x42>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7db:	31 c0                	xor    %eax,%eax
 7dd:	eb b4                	jmp    793 <malloc+0x63>
 7df:	90                   	nop
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 7e0:	8b 10                	mov    (%eax),%edx
 7e2:	89 11                	mov    %edx,(%ecx)
 7e4:	eb a4                	jmp    78a <malloc+0x5a>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 7e6:	c7 05 88 08 00 00 80 	movl   $0x880,0x888
 7ed:	08 00 00 
    base.s.size = 0;
 7f0:	b9 80 08 00 00       	mov    $0x880,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 7f5:	c7 05 80 08 00 00 80 	movl   $0x880,0x880
 7fc:	08 00 00 
    base.s.size = 0;
 7ff:	c7 05 84 08 00 00 00 	movl   $0x0,0x884
 806:	00 00 00 
 809:	e9 45 ff ff ff       	jmp    753 <malloc+0x23>
