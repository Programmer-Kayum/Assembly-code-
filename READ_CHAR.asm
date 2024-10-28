include 'emu8086.inc'
.model small
.stack 100h
.code

main proc
    
    ;input
    print 'Enter a character: '
    mov ah,1 ;inpt cmd
    int 21h   
    mov bl,al
              
    ;New line
    mov ah,2
    mov dl,10  
    int 21h
    mov dl,13 
    int 21h
    
    ;output
    print 'Output: '
    mov ah,2   ;output command  
    mov dl,bl
    int 21h 
    
  
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
 
    