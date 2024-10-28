                                                                                  include 'emu8086.inc'
.model small
.stack 100h
.data 

 array db 9,8,7,6,5,4,3,2,1,5,1

.code
 main proc
    mov ax,@data
    mov ds,ax
    
    mov si,offset array
    mov cx,10
    mov bl,[si]
    
    loopx:
    cmp [si], bl
    jle update
    
    resume:
    inc si
    loop loopx
    
   print 'Smallest number in array: '

    
    add bl,48
    mov dl,bl
    mov ah,02h ;to print output
    int 21h
    jmp exit
    
    
    update:
    mov bl,[si]
    jmp resume
    exit:
    
    main endp
 end main