;program to input two numbers and input

dosseg
.model small
.stack 100h
.data
.code
;description
main PROC
    mov ah,1    ;saying accumulator register to take input by passing 1
    int 21h     ;interrupt microprocessor
    mov bl,al   ;accumulator had saved input in al

    mov ah,1
    int 21h
    add bl,al
    sub bl,48   ;1 = 49,1 = 49 ---> 2 = 98 ---> 98-48 = 50 = 2

    mov dl,bl
    mov ah,2
    int 21h

    mov ah,4ch
    int 21h
main ENDP
end main