;Write a Program to read one of the hex digits in Uppercase (A to F), and
;a. Display it on the next line in lower case.
;b. Display it on the next line in Decimal.
;Sample Execution:
;ENTER A HEX DIGIT: C (input by user)
;IN LOWERCASE IT IS: c (output)
;IN DECIMAL IT IS: 12 (output)

dosseg
.model small
.stack 100h
.data
    msg1     db 'ENTER A HEX DIGIT: $'
    msg2     db 13, 10, 'IN LOWERCASE IT IS: $'
    msg3     db 13, 10, 'IN DECIMAL IT IS: $'
    msg4     db 13,10,'Gulshan Big Gamez PUCIT$'

    hexDigit db ?
.code
main PROC
         mov ax, @data
         mov ds, ax             ; ye heap me memory bnae ga

         mov dx, offset msg1
         mov ah, 9
         int 21h

         mov ah, 1
         int 21h
         mov hexDigit, al

         mov dx, offset msg2
         mov ah, 9
         int 21h

         mov dl, hexDigit
         add dl, 32
        
         mov ah, 2
         int 21h

         mov dx, offset msg3
         mov ah, 9
         int 21h

         mov al, hexDigit
         sub al, 55
        
         mov ah, 0 ;???
         mov bl, 10
         div bl
        
         mov bl, ah
        
         mov dl, al
         add dl, 48
         mov ah, 2
         int 21h
        
         mov dl, bl
         add dl, 48
         mov ah, 2
         int 21h
        
    ;at the end message
         mov dx,offset msg4
         mov ah,9
         int 21h
        
         mov ah, 4ch
         int 21h
main ENDP
end main