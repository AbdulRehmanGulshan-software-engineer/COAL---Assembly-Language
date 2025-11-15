;Input an Alphabet in Uppercase(i.e. no other character can be input) and display three preceding (previous) letters.

dosseg
.model small
.stack 100h
.data
    msg1      db 'ENTER AN ALPHABET: $'
    msg2      db 13, 10, 'PRECEDING ALPHABETS IN UPPER CASE ARE: $'
    msg3      db 13, 10, 'PRECEDING ALPHABETS IN LOWER CASE ARE: $'
    
    inputChar db ?

.code
main PROC
                         mov  ax, @data
                         mov  ds, ax

                         mov  dx, offset msg1
                         mov  ah, 9
                         int  21h

                         mov  ah, 1
                         int  21h
                         mov  inputChar, al
    
                         mov  dx, offset msg2
                         mov  ah, 9
                         int  21h

                         mov  cl, 3                   ; counter register hai
                         mov  bl, inputChar
                         sub  bl, 3                   ;D - 3 = A

    Print_Uppercase_Loop:
                         mov  dl, bl
                         mov  ah, 2
                         int  21h

                         inc  bl                      ; Move to next character
                         loop Print_Uppercase_Loop
    
                         mov  dx, offset msg3
                         mov  ah, 9
                         int  21h

                         mov  cl, 3                   ; counter register
                         mov  bl, inputChar
                         sub  bl, 3                   

    Print_Lowercase_Loop:
                         mov  dl, bl
                         add  dl, 32                  
                         mov  ah, 2
                         int  21h
                         inc  bl
                         loop Print_Lowercase_Loop

                         mov  ah, 4ch
                         int  21h
main ENDP
end main