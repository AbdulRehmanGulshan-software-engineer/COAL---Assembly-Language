;Variables,Data Types,Offset and LEA

dosseg
.model small
.stack 100h
.data
    ;variables are defined in .data directive of program structure
    ;dont use reserved words for variables like mov,sub,add,mul
    var1 db '1'
    var2 db ?
    var3 db '1235$'    ;string , here $ is terminato i.e. end point of string
.code
    ;description
main PROC
         mov ax,@data          ;moves memory location of @data into ax register
         mov ds,ax             ;move data addr to ds so data segment get initialized as heap memory

    ;print variable 1
         mov dl,var1
         mov ah,2
         int 21h

         mov var2,bl

    ;mov dl,var3       --> just first character from string,is liye hmare kaam ka nhi ye offset ka use kren ge
         mov dx,offset var3    ; dx is liye use kiya ke offset ka address 16 bit hota hai
    ;lea dx,var3       ;agar offset nhi use krna to ye use kr lo simply (Load Effective Address)
         mov ah,9
         int 21h

         mov ah,4ch
         int 21h
main ENDP
end main;



;DB     Define Byte     1 byte,8 bits
;DW     Define Word     2 bytes,16 bits
;DD     Define Double Word      4 bytes,32 bits
;DQ     Define Quad Word        8 bytes,64 bits
;DT     Define Ten Bytes        10 bytes,80 bits