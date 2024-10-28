.MODEL SMALL
.STACK 100H
.DATA

    NUM1 DW ?              ; First number
    RESULT DW ?           ; Result 
            
    
.CODE

START:
    MOV AX, @DATA
    MOV DS, AX
                  
    
    MOV AH, 1             ; Set up for reading a character
    INT 21H               ; Read character
    SUB AL, '0'           ; Convert ASCII to integer
    MOV AH, 0             ; Clear the upper byte
    MOV NUM1, AX           ; Store the result in NUM1   
     
                
    MOV BX, NUM1          ; Load NUM2 into BX
    MUL BX
                
    MOV RESULT, AX        ; Store  RESULT

    ; Exit program
    MOV AH, 4CH
    INT 21H
     
END START