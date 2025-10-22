;jump,conditional jump,unconditional jump and compare

dosseg
.model small
.stack 100h
.data
.code
;description
main PROC
    ;L1:
    ;mov dl,'a'
    ;mov ah,2
    ;int 21h
    ;JMP L1      ; unconditional jump

    L2:
    mov ah,1
    int 21h

    mov dl,'3'
    cmp al,dl   ;compare before jump
    je L2
    
    mov ah,4ch
    int 21h

main ENDP
end main