.MODEL small
.STACK 100h
.DATA
    str1 db 'Enter two decimal digits: $'
    str2 db 0Dh,0Ah,'The sum is greater than 10$'
    msgSum db 0Dh,0Ah,'The sum is: $'
    var1 db ?
    var2 db ?
    sum  db ?
.CODE
main PROC
    mov ax, @data
    mov ds, ax

    ;Message for input 
    mov ah, 09h
    lea dx, str1
    int 21h

    ; Input first number
    mov ah, 01h
    int 21h
    sub al, 30h       ; Convert ascii to digit
    mov var1, al

    ; Input second number
    mov ah, 01h
    int 21h
    sub al, 30h       ; Convert ascii to digit
    mov var2, al

    ; Calculate sum
    mov al, var1
    add al, var2
    mov sum, al

    ; Compare with 10
    cmp al, 10
    jge greaterThan10

    ; If sum < 10 
    mov ah, 09h
    lea dx, msgSum
    int 21h

    ; Display sum
    mov al, sum
    add al, 30h       ; Convert back to ASCII
    mov dl, al
    mov ah, 02h
    int 21h
    jmp exit

greaterThan10:
    mov ah, 09h
    lea dx, str2
    int 21h

exit:
    mov ah, 4Ch
    int 21h
main ENDP
END main