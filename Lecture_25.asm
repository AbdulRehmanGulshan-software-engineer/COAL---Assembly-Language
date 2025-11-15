;program to swap two numbers using push and pop

dosseg
.model small
.stack 100h
.data
    var1 db '2'
    var2 db '3'
.code
main proc
         mov  ax,@data
         mov  ds,ax

    ;var 1 aor var 2 to 8 bits ke hain lekin push krne ke liye 16 hona zruri hai
    ; ab hum 8 ko 16 me karna seekhte hain
         mov  al,var1     ;al is liye use kiya ke var1 bhi 8 size ka hai al bhi 8 size ka
         mov  ah,0        ;is al ko ax yaani 16 bna de ga
         push ax

         mov  bl,var2
         mov  bh,0        ;uper wali higher 8 bits ko 0 kr diya ,phir bx bn gya 16 bits ka total bx = bl + bh
         push bx

         pop  ax
         mov  dl,al
         mov  ah,2
         int  21h

         pop  bx
         mov  dl,bl
         mov  ah,2
         int  21h

         mov  ah,4ch
         int  21h
main endp
end main