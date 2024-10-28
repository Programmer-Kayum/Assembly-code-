.MODEL SMALL
.STACK 100H
.DATA
        NUM DW 1111b,1011b
        PRODUCT DW ?


.CODE 
START: 
    MOV AX,DATA
    MOV DS,AX

    LEA SI,NUM       ; SI pointed to the Multiplicand
    MOV AX,[SI]      ; Multiplicand has to be in AX register
    MOV BX,[SI+2]    ; SI+2 pointed to the Multiplier and move it to BX
    MUL BX
                     ;Perform the multiplication
    MOV PRODUCT,AX   ;32 bit product stored in DX-AX registers
    MOV PRODUCT+2,DX

    MOV AH,4CH
    INT 21H  
    
    CODE ENDS
END START