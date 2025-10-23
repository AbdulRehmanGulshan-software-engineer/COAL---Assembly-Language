dosseg

.model small
.stack 100h
.data
msg1 db 'Bx is lower$'
msg2 db 'Ax is lowest$'
.code
;description
main PROC
    mov ax,@data
    mov ds,ax

    mov ax,70h
    mov bx,40h
    ; apply compare
    cmp ax,bx
    jg L1
    mov dx,offset msg2
    mov ah,9
    int 21h
    jmp exit

    L1:
        mov dx,offset msg1
        mov ah,9
        int 21h
        jmp exit
    exit:
        mov ah,4ch
        int 21h
    
main ENDP
end main