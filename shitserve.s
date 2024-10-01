.intel_syntax noprefix
.globl _start

.section .text

strlen:
    xor rdx, rdx            # Clear rax to use it for the length
loop:
    cmp byte ptr [rsi + rdx], 0  # Compare the byte at rsi + rax with 0
    je done
    inc rdx                    # Increment the length counter
    jmp loop
done:
    ret

find_carriage_return:
    mov rcx, 175                 # Initialize offset counter

find_cr_loop:
    mov al, byte [rsi + rcx]    # Load byte from the request at current offset
    cmp al, 0x0D               # Compare with ASCII code of '\r' (0x0D)
    je found_cr                # Jump to found_cr if '\r' is found
    inc rcx                    # Increment offset counter
    jmp find_cr_loop           # Loop back to check next character

found_cr:
    add rcx, 5                 # Move past "\r\n"
    ret

_start:

parent_process:

    mov rdi, 2
    mov rsi, 1
    mov rdx, 0
    mov rax, 0x29     # socket
    syscall
    mov r10, rax #socket

    mov rdi, rax
    lea rsi, sockaddr_in
    mov rdx, 16
    mov rax, 49 #bind
    syscall

    xor rsi, rsi
    mov rax, 50 #listen
    syscall

   
accept_again:

    mov rdi, r10   
    xor rdx, rdx
    mov rax, 43 #accept
    syscall
    mov r8, rax

    mov rax, 0x39 #fork
    syscall

    cmp rax, 0  #if
    je child_process

    mov rdi, r8
    mov rax, 3
    syscall #close connection


    
jmp accept_again

child_process:

    mov rdi, r10
    mov rax, 3 #close
    syscall

    mov rdi, r8
    lea rsi, buffer
    mov rdx, 512
    xor rax, rax #read http request
    syscall

    lea rsi, buffer + 5  # Load address of buffer+5 into rsi (source)
    lea rdi, file      # Load address of output into rdi (destination)
    mov rcx, 16            # Set counter to 16 (number of bytes to copy)

    rep movsb                 # Copy 16 bytes from [rsi] to [rdi] #POST


    mov cl, buffer
    cmp cl, 'P'
    jne GET

    lea rsi, buffer
    call find_carriage_return

    lea rsi, [buffer + rcx]  # Load address of buffer+183 into rsi (source)
    lea rdi, pdata      # Load address of output into rdi (destination)
    mov rcx, 512            # Set counter to 512 (number of bytes to copy)

    rep movsb                 # Copy 512 bytes from [rsi] to [rdi] #POST


    lea rdi, file
    mov rsi, 00000101 #O_WRONLY|O_CREAT
    mov rdx, 0777 #permissions
    mov rax, 2 #open file
    syscall

    mov r9, rax #filedescriptor

    lea rsi, pdata
    call strlen
    mov rdi, rax
    mov rax, 1 #write
    syscall

    mov rax, 3 #exit
    syscall

    mov rdi, r8
    lea rsi, http_response
    mov rdx, 19
    mov rax, 1 #write
    syscall

jmp exit

GET:
    lea rsi, buffer + 4  # Load address of buffer+4 into rsi (source)
    lea rdi, file      # Load address of output into rdi (destination)
    mov rcx, 16            # Set counter to 16 (number of bytes to copy)

    rep movsb                 # Copy 16 bytes from [rsi] to [rdi] #POST


    lea rdi, file
    mov rsi, 0
    mov rax, 2 #open file
    syscall

    mov r9, rax #filedescriptor

    mov rdi, rax
    lea rsi, flag
    mov rdx, 256
    mov rax, 0 #read
    syscall

    mov rax, 3 #exit
    syscall

    mov rdi, r8
    lea rsi, http_response
    mov rdx, 19
    mov rax, 1 #write
    syscall

    lea rsi, flag
    call strlen

    mov rax, 1 #write
    syscall


exit:
    
    mov rdi, 0
    mov rax, 60     # exit
    syscall

.section .data
sockaddr_in:
    .word 2                  # sin_family (AF_INET)
    .word 0x5000            # sin_port (80 in network byte order)
    .long 0x00000000        # sin_addr (0.0.0.0) in network byte order)
    .space 8                 # padding for alignment (if necessary)

buffer:
    .space 512

http_response:
    .asciz "HTTP/1.0 200 OK\r\n\r\n"

flag:
    .space 256

file:
    .space 17

pdata:
    .space 51
