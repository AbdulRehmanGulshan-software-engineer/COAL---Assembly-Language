;Stack,Push,,Pop and Example of Push and Pop

dosseg
.model small
.stack 100h
.data
.code
main proc

mov ax,2
push ax     ;push to stack
pop ax
mov dx,ax
add dx,48
mov ah,2
int 21h
mov ah,4ch
int 21h

main endp
end main
