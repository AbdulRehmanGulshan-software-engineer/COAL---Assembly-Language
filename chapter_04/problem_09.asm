dosseg
.model small
.stack 100h
.data
    msg  db 0AH,0DH,"Enter Three Initials: $"
    c1   db ?,0AH,0DH
    c2   db ?,0AH,0DH
    c3   db ?,'$'
.code
main proc

    ;print message
         mov dx,offset msg
         mov ah,9
         int 21h
    ;read and store 1st
         mov ah,1
         int 21h
         mov c1,al

    ;read and store 2nd
         mov ah,1
         int 21h
         mov c2,al

    ;read and store 3rd
         mov ah,1
         int 21h
         mov c3,al

    ;display enter
         mov ah,2
         mov dl,0AH
         int 21h
         mov ah,2
         mov dl,0DH
         int 21h
    ;print output
         mov dx,offset c1
         mov ah,9             ;read until $
         int 21h

         mov ah,4ch
         int 21h

main endp
end main