; Program 8: Display "?", read two decimal digits, and show their sum (corrected)
.MODEL SMALL
.STACK 100H
.DATA
QMARK   DB '?$'
MSG1    DB 0DH,0AH,'THE SUM OF $'
ANDMSG  DB ' AND $'
ISMSG   DB ' IS $'
NEWLINE DB 0DH,0AH,'$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; display ?
    MOV AH, 9
    MOV DX, OFFSET QMARK
    INT 21H

    ; read first digit (single key, no Enter required)
    MOV AH, 1
    INT 21H           ; returns ASCII char in AL
    SUB AL, '0'       ; ASCII -> numeric
    MOV BL, AL        ; store first digit in BL

    ; read second digit
    MOV AH, 1
    INT 21H
    SUB AL, '0'       ; ASCII -> numeric
    MOV BH, AL        ; store second digit in BH

    ; calculate sum in AL
    MOV AL, BL
    ADD AL, BH        ; AL = sum (0..18)

    ; print newline for neatness
    MOV AH, 9
    MOV DX, OFFSET NEWLINE
    INT 21H

    ; print "THE SUM OF "
    MOV AH, 9
    MOV DX, OFFSET MSG1
    INT 21H

    ; print first digit
    MOV DL, BL
    ADD DL, '0'       ; numeric -> ASCII
    MOV AH, 2
    INT 21H

    ; print " AND "
    MOV AH, 9
    MOV DX, OFFSET ANDMSG
    INT 21H

    ; print second digit
    MOV DL, BH
    ADD DL, '0'
    MOV AH, 2
    INT 21H

    ; print " IS "
    MOV AH, 9
    MOV DX, OFFSET ISMSG
    INT 21H

    ; === print the sum properly ===
    CMP AL, 10        ; if AL < 10 -> single digit
    JB  SINGLE_DIGIT

    ; two-digit sum path
    MOV AH, 0         ; clear AH so AX = sum
    MOV CL, 10        ; divisor = 10 (use CL to avoid clobbering BL/BH)
    DIV CL            ; AX / 10 -> AL = quotient (tens), AH = remainder (ones)

    ; print tens digit (quotient in AL)
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; print ones digit (remainder in AH)
    MOV AL, AH
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 2
    INT 21H

    JMP END_PROGRAM

SINGLE_DIGIT:
    ADD AL, '0'       ; numeric -> ASCII
    MOV DL, AL
    MOV AH, 2
    INT 21H

END_PROGRAM:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
