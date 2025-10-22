;program to print capital letters from A to Z using Loop

dosseg
.model small
.stack 100h
.data
.code
;description
main PROC
    mov cx,26
    mov dx,65
gulshan:
    mov ah,2
    int 21h
    inc dx
    loop gulshan
main ENDP
end main