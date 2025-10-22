;program to add two numbers i.e. 1+2=3

dosseg
.model small
.stack 100h
.data
.code
;description
main PROC
    mov bl,1
    mov cl,2
    add bl,cl
    ;we need 3 to print on screen so 
    add bl,48   ;as 0 = 48 in ascii
    mov dl,bl   ;mov it to data register
    mov ah,2
    int 21h

    mov ah,4ch    ;exit from accumulator register
    int 21h
main ENDP
end main