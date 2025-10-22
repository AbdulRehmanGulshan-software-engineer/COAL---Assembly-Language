; Program to print a character with characters

dosseg
.model small
.stack 100h
.data
.code
Main PROC
mov dl,'a'
mov ah,2
int 21h

mov dl,'l'
mov ah,2
int 21h

mov dl,'i'
mov ah,2
int 21h

Main ENDP
end Main


