dosseg
.model small
.stack 100h
.data
    msg_equal     db ' congratulations! number is equal$'
    msg_not_equal db ' Number is not equal$'
.code
    ;description
main PROC
                    mov ax,@data                   ;accessing data
                    mov ds,ax

    ;read a single character i.e. digit
                    mov ah,1
                    int 21h                        ;user input will store in AL

                    mov dl,'3'                     ;given number (IN ASCII)
                    cmp al,dl
                    je  msg_equal_label
                    jne msg_noteq_label

    msg_equal_label:
                    mov dx,offset msg_equal
                    mov ah,9
                    int 21h
                    jmp exit_program
    msg_noteq_label:
                    mov dx,offset msg_not_equal
                    mov ah,9
                    int 21h
                    jmp exit_program
    exit_program:   
                    mov ah,4ch
                    int 21h
main ENDP
end main