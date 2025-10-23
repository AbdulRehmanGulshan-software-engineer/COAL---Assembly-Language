dosseg

.model small
.stack 100h
.data
.code
;description
main PROC
    ; input red balls
    mov ah,1
    int 21h
    mov ax,al ;bit match issue

    ; input blue balls
    mov ah,1
    int 21h
    mov bx,al  ;bit match issue

    ;compare both
    cmp bx,ax
    jg L1
    mov cx,'0'
    jmp exit

    L1:
        mov cx,bx
        jmp exit
    
    exit:
        mov ah,4CH
        int 21h
main ENDP
end main;