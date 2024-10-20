section .data 
    pi: dq 3.14159
    radius: equ 10

section .text
global main
extern printf

main:
    push rbp
    mov rbp, rsp
    call circle ; calling circle


    mov rsp, rbp
    pop rbp
    mov rax, 0
    ret

area: 
    section .data
    .fmt_area: db `The area if %f\n\0`
    section .text
    push rbp
    mov rbp, rsp

    movsd xmm0, [pi] ;xmm have their own instructions, sd for double and ss for float.
    mov rax, radius
    cvtsi2sd xmm1, rax ;converting radius into double and storing it in xmm1

    mulsd xmm1, xmm1 ;r^2
    mulsd xmm0, xmm1 ;pi

    mov rdi, .fmt_area ;moving the pointer to the sting into rdi
    mov rax, 1 ;tells printf that we are using 1 vector argument in xmm0.
    call printf

    mov rsp, rbp
    pop rbp
    mov rax, 0
    ret

circum: 
    section .data
    .fmt_circum: db `The circumference of the circle is %f\n\0`
    section .text
    push rbp
    mov rbp, rsp
    movsd xmm0, [pi] ;xmm have their own instructions, sd for double and ss for float.
    mov rax, radius
    cvtsi2sd xmm1, rax

    addsd xmm1, xmm1
    mulsd xmm0, xmm1

    mov rdi, .fmt_circum ;moving the pointer to the sting into rdi
    mov rax, 1 ;tells printf that we are using 1 vector argument in xmm0.
    call printf

    mov rsp, rbp
    pop rbp
    mov rax, 0
    ret


circle:
 section .data
    .fmt_radius: db `The circle has a radius of %f\n\0`
    section .text
    push rbp
    mov rbp, rsp
    mov rax, radius
    cvtsi2sd xmm0, rax
    mov rdi, .fmt_radius
    mov rax, 1
    call printf

    call area ;calling area
    call circum ;calling circum

    mov rsp, rbp
    pop rbp
    mov rax, 0
    ret
