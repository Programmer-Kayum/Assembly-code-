.MODEL SMALL
.STACK 100H
.DATA

    NUM1 DW ?              ; First number
    NUM2 DW ?              ; Second number
    RESULT DW ?           ; Result 
            
    
.CODE

START:
    MOV AX, @DATA
    MOV DS, AX
                  
    ; Read first single-digit number
    MOV AH, 1             ; Set up for reading a character
    INT 21H               ; Read character
    SUB AL, '0'           ; Convert ASCII to integer
    MOV AH, 0             ; Clear the upper byte
    MOV NUM1, AX           ; Store the result in NUM1   
    
    ; new line
    
    MOV AH, 2          ; DOS function to display a character
    MOV DL, 0Dh        ; Carriage return (ASCII 13)
    INT 21H            ; Call DOS interrupt
    MOV DL, 0Ah        ; Line feed (ASCII 10)
    INT 21H 

    ; Read second single-digit number
    MOV AH, 1             ; Set up for reading a character
    INT 21H               ; Read character
    SUB AL, '0'           ; Convert ASCII to integer
    MOV AH, 0             ; Clear the upper byte
    MOV NUM2, AX           ; Store the result in NUN2
                 
    
                
    MOV BX, NUM2          ; Load NUM2 into BX
    MOV AX, NUM1          ; Load NUM1 into AX
    MUL BX
                

    MOV RESULT, AX        ; Store  RESULT
         
    
    ; Exit program
    MOV AH, 4CH
    INT 21H
     
END START