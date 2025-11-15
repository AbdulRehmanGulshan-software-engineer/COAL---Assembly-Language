;program to print the input number is equal or not to given number in program

dosseg
.model small
.stack 100h
.data
    msg1 db ' Congratulations! number is equal$'
    msg2 db ' number is not equal$'
.code
    ;description
main PROC
         mov ax,@data         ;ratta
         mov ds,ax

    ;input number
         mov ah,1
         int 21h

    ;given number
         mov dl,'3'

         cmp al,dl
         je  L1
         mov dx,offset msg2
         mov ah,9
         int 21h
         mov ah,4ch
         int 21h

    L1:  
         mov dx,offset msg1
         mov ah,9
         int 21h
main ENDP
end main