; Program Structure

.model tiny ; code + data <= 64kb
.model small ; code <= 64KB , Data <= 64KB
.model Medium   ;Code = Any Size , Data <= 64kb
.model compact ; Code <= 64kb,data = any size
.model large    ; code <= 64kb , data = any size
.model Huge     ;code = any size, data = any size



dosseg          ; agar hmse segments me galti ho DOS khudi dekh le ga
; we will use .model small as beginner level coder
.model small
.stack 100h     ;specifies the storage for stack
.data   ; data segment directives
; variables are defined here
.code       ; code segment directive

Main proc

Mov dl,'A'
Mov ah,2
INT 21h


Mov ah,4ch      ; bhai nikal aa bahir register se 
INT 21h         ; cpu ko interrupt kro ke pehle ye kar
Main endp


End Main    ;program end ho rha idhr
