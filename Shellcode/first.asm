global _start

section .data
message: db "Hello, world!", 0xa
message_length: equ $ - message

section .text
_start: mov eax, 0x4
        mov ebx, 0x1
        mov ecx, message
        mov edx, message_length
        int 0x80

        mov eax, 0x1
        mov ebx, 0x0
        int 0x80



@ nano hello.asm
@ nasm -f elf32 hello.asm

@ objdump -d $1 | grep -Po '\s\K[a-f0-9]{2}(?=\s)' | sed 's/^/\\x/g' | perl -pe 's/\r?\n//' | sed 's/$/\n/'
@ objdump -d ./hello.asm | grep -Po '\s\K[a-f0-9]{2}(?=\s)' | sed 's/^/\\x/g' | perl -pe 's/\r?\n//' | sed 's/$/\n/'
@ sled twoa poluchawame hex-a
@ kato string go inject-wame 
@ python print(Hexa otgore)
@ posle gets aok ima go podawame i se zapazwa w pametta kato originala


@ objdump -d ./hello

@ python -> ptint(toq ujas)

@ after optimization
@ ecx addr variable 

global _start

section .data
message: db "Hello, world!", 0xa
message_length: equ $ - message

section .text
_start: 
        push 0x4
        pop eax

        push 0x1
        pop ebx

        @ push message
        @ push 0x67646c6f
        push 0x6f6c6467
        pop ecx, esp

        @ push 0xe
        push 0x4
        pop edx

        int 0x80

        push 0x1
        pop eax

        push 0x0
        pop ebx

        int 0x80


@ execv s assembly

@ global _start
@ section .text
@         push 0x59
@         pop eax

@         push 0x69622f2f
@         push 0x68732f6e

@         mov ebx, esp
@         push esp
@         @ push esp zamazwa gornite raboti, a stakptr ni trqbwa?????????

@         mov ecx, esp

@         @ xor ecx, ecx
@         xor edx, edx

@         int 0x80


global _start
section .text
        xor eax, eax
        push eax

        push 0x69622f2f
        push 0x68732f6e

        mov ebx, esp
        mov ecx, esp
        mov edx, eax
        mov al, 0x59

        int 0x80

        @ mov eax, 0x1
        push 0x1
        pop eax

        mov ebx, 0x0
        int 0x80


