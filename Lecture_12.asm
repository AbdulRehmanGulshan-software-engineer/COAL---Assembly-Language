;program to convert capital lecture to small letter

dosseg
.model small
.stack 100h
.data
.code
;description
main PROC
    ;input from user
    mov ah,1
    int 21h

    add al,32
    
    mov dl,al

    mov ah,2
    int 21h
    
    mov ah,4ch
    int 21h
main ENDP
end main