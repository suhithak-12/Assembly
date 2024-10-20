section .data
        pi: dq 3.14159
        radius: dq 10.0

section .text
global main
extern printf

main:
        
        push rbp
        mov rbp, rsp
        

        mov rax, 0
        mov rsp, rbp
        pop rbp
        ret
area:
        section .data
        .fmt_area: db `The area is %f\n\0`
        section .text
        push rbp
        mov rbp, rsp
        movsd xmm0, [pi]
        movsd xmm1, [radius]

        mulsd xmm1,xmm1
        mulsd xmm0, xmm1

        mov rdi, .fmt_area
        mov rax, 1
        call printf

        mov rax, 0
        mov rsp, rbp
        pop rbp
        ret
cricum:
        push rbp
        mov rbp, rsp


        mov rax, 0
        mov rsp, rbp
        pop rbp
        ret
circle:
push rbp
        mov rbp, rsp


        mov rax, 0
        mov rsp, rbp
        pop rbp
        ret