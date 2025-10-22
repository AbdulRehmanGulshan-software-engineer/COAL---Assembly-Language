;Array,dup and Source Index

dosseg
.model small
.stack 100h
.data
    arr1 db '1','2','3','4'
    arr2 db 'a','b','c'
    arr3 db 'abc'            ;same as arr2
    arr4 db 'a'.'a','a'
    arr5 db ?,?,?,?,?,?,?    ;uninitialized
    arr6 db 3 dup('a')        ;same as arr4
    arr7 db 7 dup('?')        ;same as arr5
.code
    ;description
main PROC
         mov ax,@data
         mov ds,ax

    ; how we will access array
    ; we will access using si i.e. source index register
         mov si,offset arr1
         mov dx,[si]           ;bracket form to access value at address
         mov ah,2
         int 21h

         mov dx,[si+1]
         mov ah,2
         int 21h

         mov dx,[si+2]
         mov ah,2
         int 21h

         mov dx,[si+3]
         mov ah,2
         int 21h
    
main ENDP
end main