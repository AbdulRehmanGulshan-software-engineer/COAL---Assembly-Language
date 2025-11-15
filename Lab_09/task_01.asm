; Write a program that prompt to the user to enter two decimal digits then display them and their sum on the next line if sum is less than 10 and If sum is greater than or equal to 10 then display a message “ THE SUM IS GREATER THAN TEN”	 									
; Sample execution:
; PLEASE ENTER TWO DECIMAL DIGITS:  15
; THE SUM OF 1 AND 5 IS 6 
; PLEASE ENTER TWO DECIMAL DIGITS:  95
; THE SUM IS GREATER THAN TEN

dosseg
.MODEL small
.STACK 100h
.DATA
    str1        db 'enter digits: $'
    var1        db ?
    var2        db ?
    sum         db ?
    str2        db 0Dh,0Ah,'sum is Greater than 10$'
    Sum_message db 0Dh,0Ah,'sum is: $'
.CODE
main PROC
                  mov ax, @data
                  mov ds, ax

    ;input message
                  mov ah, 9
                  MOV DX,offset str1
                  int 21h

    ;first number from user
                  mov ah, 1
                  int 21h
                  sub al, 30h                  ; Convert ascii to digit
                  mov var1, al

    ; second number from user
                  mov ah, 1
                  int 21h
                  sub al, 30h                  ; Convert ascii to digit
                  mov var2, al

    ; sum calculating
                  mov al, var1
                  add al, var2
                  mov sum, al

    ; Comparing and jump
                  cmp al, 10
                  jge greaterThan10

    ; If sum is less than 10
                  mov ah,9
                  mov dx,offset Sum_message
                  int 21h

    ; output result
                  mov al, sum
                  add al, 30h                  ; Converting back to ASCII
                  mov dl, al                   ; problem was here of T
                  mov ah, 2
                  int 21h
                  jmp delete

    greaterThan10:
                  mov ah, 09h
                  mov dx,offset str2
                  int 21h

    delete:       
                  mov ah, 4Ch
                  int 21h
main ENDP
END main