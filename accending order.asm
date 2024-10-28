include "emu8086.inc"
.model small
.stack 100h

.data
    numbers db 5, 2, 7, 1, 8, 3      ; Example set of numbers to sort
    numCount equ ($ - numbers)      ; Number of elements in the array

.code 
main proc
    mov ax, @data
    mov ds, ax

    mov bx, 0                       ; Outer loop counter
    outer_loop:
        mov cx, numCount-1          ; Inner loop counter
        mov si, offset numbers      ; Point SI to the beginning of the array

    inner_loop:
        mov al, [si]                ; Load the current element
        mov dl, [si+1]              ; Load the next element

        cmp al, dl                  ; Compare the current element with the next element
        jle skip_swap               ; If the current element is less than or equal to the next element, skip swapping

        mov [si], dl                ; Swap the elements
        mov [si+1], al

    skip_swap:
        inc si                       ; Move to the next element
        loop inner_loop              ; Continue inner loop until cx is zero

    inc bx                          ; Increment the outer loop counter
    cmp bx, numCount-1              ; Compare the outer loop counter with the number of elements - 1
    jl outer_loop                   ; Jump back to the outer loop if bx is less than numCount - 1

    ; Display the sorted numbers
    mov si, offset numbers
    mov cx, numCount
    display_loop:
        mov dl, [si]
        add dl, 48                 ; Convert to ASCII
        mov ah, 2                  ; DOS display function
        int 21h 
        
        print "   "

        inc si
        loop display_loop

    mov ah, 4Ch                      ; Exit program
    int 21h
    main endp



end main

