section .data
    output_format db "Factorial of 5 is: %d", 10, 0

section .bss
    result resq 1

section .text
    global _start

_start:
    ; Calculate factorial of 5
    mov rax, 1
    mov rcx, 5
    xor rdx, rdx
    loop_start:
        mul rcx
        dec rcx
        jnz loop_start

    ; Store the result in the result variable
    mov [result], rax

    ; Print the result
    mov rdi, output_format
    mov rsi, [result]
    mov rax, 0x1
    call printf

    ; Exit the program
    mov rax, 0x60         ; syscall number for exit
    xor rdi, rdi          ; exit status 0
    syscall

section .text
global printf

printf:
    ; Write the format string to stdout
    mov rax, 0x1           ; syscall number for write
    mov rdi, 0x1           ; file descriptor 1 (stdout)
    mov rdx, 21            ; length of the format string
    syscall

    ; Write the result to stdout
    mov rax, 0x1           ; syscall number for write
    mov rdi, 0x1           ; file descriptor 1 (stdout)
    mov rdx, 8             ; length of the result (64-bit integer)
    syscall

    ret
