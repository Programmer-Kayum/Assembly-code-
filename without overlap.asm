include "emu8086.inc"

.model small
.stack 100h

.data
  arr db 1,2,3,4
  arr2 db 4 dup(?)

.code
 main proc
    mov ax, @data
    mov ds,ax 
    
    mov si, offset arr ; si allocate the location of zeroth value of arr
    
    mov di, offset arr2
    
    mov cx,4
    
    loopA: 
      mov al, [si]
      mov [di],al
      
      inc si
      inc di
      loop loopA 
      
      print "Value in new memory blocks: "  
      
      mov cx,4
      mov di, offset arr2
      
    loopA2:
      mov dl, [di]
      add dl, 48
      mov ah, 2
      int 21h
      
      mov dl, 32
      mov ah, 2   ;print space
      int 21h
      
      inc di
      loop loopA2
      
      main endp 
 
 end
 
    
    
