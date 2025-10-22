;Variables,Data Types,Offset and LEA

dosseg
.model small
.stack 100h
.data
    ;variables are defined in .data directive of program structure
    ;dont use reserved words for variables like mov,sub,add,mul
    var1 db '1'
    var2 db ?
    var3 db '1235$'
.code
;description
main PROC
    mov ax,@data   ;moves memory location of @data into ax register
    mov ds,ax   ;move data addr to ds so data segment get initialized as heap memory

    ;print variable 1
    mov dl,var1
    mov ah,2
    int 21h

    mov var2,bl
    mov dx,offset var3
    mov ah,9
    int 21h

    mov ah,4ch
    int 21h
main ENDP
end main;
