dosseg
.model small
.stack 100h
.data
    msg  db 0AH,0DH,'THE SUM OF '
    c1   db ?,' AND '
    c2   db ?,' IS '
    sum  db ?,'$'

.code
main proc
         mov ax,@data
         mov ds,ax

    ; display ?
         mov dl,'?'
         mov ah,2
         int 21h


    ; input numbers
         mov ah,1             ;input first digit
         int 21h
         mov c1,al            ;c1 --->  ? , 'A', 'N', 'D'    , ? me al ki value aa jae gi ab

         mov ah,1             ;input second digit
         int 21h
         mov c2,al

    ; adding two numbers
         add al,c1
         sub al,30H           ;similar to sub al,48
         mov sum,al

    ;print the message
         mov dx,offset msg    ;DX me ek memory address de do, aur DOS se bolo: ‘print string from here until you see a $ sign.
         mov ah,9
         int 21h

    ;return to dos
         mov ah,4ch
         int 21h

main endp
end main


