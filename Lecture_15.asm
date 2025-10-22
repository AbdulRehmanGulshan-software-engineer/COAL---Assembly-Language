;Loop,label,Counter Register,inc and Program to print 0 to 9

dosseg
.model small
.stack 100h
.data
.code
;description
main PROC
    mov cx,10   ;counter register
    mov dx,48   

    gulshan:     ;label name
    mov ah,2
    int 21h
    
    inc dx      ;add dx,1

    loop gulshan

main ENDP
end main