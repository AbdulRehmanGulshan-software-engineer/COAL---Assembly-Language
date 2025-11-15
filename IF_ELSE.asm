;assembly me ye sab jump instructions ke zariye hota hai

dosseg
.model small
.stack 100h
.data
    var1 db '2'
    var2 db '2'
    msg1 db 'Numbers Are Equal!$'
    msg2 db 'Numbers Are Different'
    msg3 db 'Thanks For Checking My Code$'
.code
main proc
            mov ax,@data
            mov ds,ax


    ;cmp var1,var2   ;memory to memory cannot compare
    ;iska solution aik ko register me le ao
            mov cl,var1
            cmp cl,var2

            je  gulshan
    ;else part will be here
            mov dx,offset msg2
            mov ah,9
            int 21h
            jmp exit

    gulshan:
            mov dx,offset msg1
            mov ah,9
            int 21h
            jmp exit


    exit:   
    ;first add new line
            mov dl,0DH            ; similar to mov dl,13
            mov ah,2
            int 21h
            mov dl,0AH            ;similar to mov dl,10
            mov ah,2
            int 21h
            
            mov dx,offset msg3
            mov ah,9
            int 21h
            mov ah,4ch
            int 21h
    

main endp
end main