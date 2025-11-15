;program to print two different strings on two different lines

dosseg
.model small
.stack 100h
.data
    msg1 db 'Hello Big Gamez PUCIT$'
    msg2 db 'Gulshan Loves Programming$'
.code
    ;description
main PROC
         mov ax,@data
         mov ds,ax

         mov dx,offset msg1
         mov ah,9
         int 21h

    ;code for new line
         mov dx,10
         mov ah,2
         int 21h
    ; code for carriage return
         mov dx,13
         mov ah,2
         int 21h

         mov dx,offset msg2    ; similar to (lea dx,msg2)
         mov ah,9
         int 21h

         mov ah,4ch
         int 21h

main ENDP
end main