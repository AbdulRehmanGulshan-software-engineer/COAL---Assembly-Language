;program to print an array using loop

dosseg
.model small
.stack 100h
.data
    arr1 db '1','2','3','4','5','6','7'
.code
    ;description
main PROC
         mov  ax,@data
         mov  ds,ax

         mov  si,offset arr1
         mov  cx,7              ;counter register
    L1:  
         mov  dx,[si]
         mov  ah,2
         int  21h
         inc  si
         Loop L1
main ENDP
end main