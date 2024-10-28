include 'emu8086.inc'
.model small
.stack 100h
.data
max_t db 10
min_t db 6
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov al,max_t
    add al,min_t
    mov ah,00h
    mov bl,02h
    div bl ;
    
    
    mov bl,al
    
    print 'Average Temperature= '
    add bl,48
    mov dl,bl
    mov ah,02h
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    