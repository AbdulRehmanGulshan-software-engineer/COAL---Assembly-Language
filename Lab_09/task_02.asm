dosseg
.MODEL SMALL
.STACK 100H
.DATA
     ARR  DB 2AH, 12H, 15H, 3FH, 20H, 14H     ; array elements
     LEN  DB 6                                ; number of elements
     MSG1 DB "largEst number is : $"

.CODE
MAIN PROC
          MOV  AX, @DATA           ; heap concept
          MOV  DS, AX

     ; initializer
          MOV  SI, OFFSET ARR
          MOV  CL, LEN             ; number of elements = 6
          DEC  CL                  ; for compareing n-1
          MOV  AL, [SI]            ; assume element [0] is largest like c++ codes

     NEXT:
          INC  SI                  ; move to next element
          CMP  AL, [SI]            ; compare AL with next element
          JAE  SKIP                ; if AL >= [SI] then skip
          MOV  AL, [SI]            ; warna new largest ko save kr lo
     SKIP:
          LOOP NEXT                ; repeat until CL = 0

     ; result displaying
          MOV  DX, OFFSET MSG1
          MOV  AH, 9
          INT  21H

     ; AL register to hexadecimal
          MOV  AH, 0
          AAM                      ; programoligy wala concept
          ADD  AH, '0'
          ADD  AL, '0'

          MOV  DL, AH
          MOV  AH, 2
          INT  21H

          MOV  DL, AL
          MOV  AH, 2
          INT  21H

     ; exit
          MOV  AH, 4CH
          INT  21H

MAIN ENDP
END MAIN

; 😂 still output wrong hai 


