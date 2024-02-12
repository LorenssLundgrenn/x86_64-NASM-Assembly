; the CPU has two sets of general-purpose registers for 
; both 32-bit and 64-bit operations, both of which can be 
; accessed through assembly code. 
; 32-bit registers are prefixed with 'b', while 64-bit 
; registers are prefixed with 'r'

    ; general-purpose register subsets:
    ; 32-bit: eax, ebx, ecx, edx
    ; 64-bit: rax, rbx, rcx, rdx

; the CPU also contains special registers that are used 
; for specific operations, like flag registers, index and
; pointer registers, etc. These special registers have 
; specific use cases, and may or may not be divided into
; seperate sets of 32-bit and 64-bit registers

extern GetStdHandle
extern WriteFile
extern ExitProcess

; constant variables
section .rodata
    msg db "Hello World!", 0x0d, 0x0a
    msg_len equ $-msg

    stdout_query equ -11

; mutable variables
section .data
    stdout dw 0
    bytes_written dw 0

section .text
    global start

; program entry point
start:
    mov rcx, stdout_query
    call GetStdHandle
    mov [rel stdout], rax

    mov rcx, [rel stdout]
    mov rdx, msg
    mov r8, msg_len
    mov r9, bytes_written
    push qword 0
    call WriteFile

    xor rcx, rcx
    call ExitProcess