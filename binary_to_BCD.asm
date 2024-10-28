data segment
    
bin equ 1100b
result dw ? 

data ends

code segment
assume cs:code, ds:data

start:

    mov ax,data
    mov ds,ax

    mov bx,bin
    mov ax,0h
    mov cx,0h

again0:

    cmp bx,0h
    jz endprg
    dec bx

    mov al,cl
    add al,01h
    daa

    mov cl,al
    mov al,ch
    adc al,00h
    daa

    mov ch,al
    jmp again0

endprg:

    mov result,cx
    int 21h

code ends
end start