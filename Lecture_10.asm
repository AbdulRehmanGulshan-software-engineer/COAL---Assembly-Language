;program to subtract two numbers

dosseg
.model small
.stack 100h
.data
.code
;description
main PROC
    mov bl,5
    mov ch,1
    sub bl,ch

    add bl,48
    mov dl,bl
    mov ah,2
    int 21h

    mov ah,4ch
    int 21h
main ENDP
end main
