.MODEL SMALL
.STACK 100H
.DATA

    NUM1 DW ?              ; First number
    NUM2 DW ?              ; Second number
    RESULT DW ?           ; Result of division
    REMENDER DW ?         ; Remainder after division
    
.CODE

START:
    MOV AX, @DATA
    MOV DS, AX
                  
    ; Read first single-digit number
    MOV AH, 1             ; Set up for reading a character
    INT 21H               ; Read character
    SUB AL, '0'           ; Convert ASCII to integer
    MOV AH, 0             ; Clear the upper byte
    MOV NUM1, AX           ; Store the result in NUM 
    
    MOV AH, 2          ; DOS function to display a character
    MOV DL, 0Dh        ; Carriage return (ASCII 13)
    INT 21H            ; Call DOS interrupt
    MOV DL, 0Ah        ; Line feed (ASCII 10)
    INT 21H            ; Call DOS interrupt


    ; Read second single-digit number
    MOV AH, 1             ; Set up for reading a character
    INT 21H               ; Read character
    SUB AL, '0'           ; Convert ASCII to integer
    MOV AH, 0             ; Clear the upper byte
    MOV NUM2, AX           ; Store the result in NUN
                 
    ; Perform division: AX / NUN -> Quotient in AL, Remainder in AH
    MOV AX, NUM1           ; Load NUM into AX
    MOV DX, 0             ; Clear DX for 16-bit division
    MOV BX, NUM2           ; Load NUN into BX (divisor)

    DIV BX                ; Divide AX by BX (NUM / NUN)
     
    MOV RESULT, AX        ; Store quotient in RESULT
    MOV REMENDER, DX      ; Store remainder in REMENDER
    
    ; Exit program
    MOV AH, 4CH
    INT 21H
     
END START
