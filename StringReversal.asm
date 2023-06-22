.model tiny
.code
org 100h

start:
   jmp begin

   msg db "Enter word:$"
   msg2 db "Reverse word:$"
   in1 db  30 dup(36)
   rev db 30 dup(36)    
   newline db 13,10,'$'
   palin1 db "This is palindrome$"
   palin2 db "This is not palindrome$"
    
begin:                 
    xor cx,cx
   mov ah,9
   lea dx,msg
   int 21h
   mov ah,0ah
   lea dx,in1
   int 21h
   lea si,in1+1
   mov cl,[si]
   lea di,rev
   inc si                        
   add di,cx
   dec di
   push cx
trans: 
    mov bl,[si]
    mov [di],bl
    dec di
    inc si   
    loop trans     

    mov ah,9  
    lea dx,newline
    int 21h                  
    lea dx,msg2
    int 21h
    lea dx,rev 
    int 21h     
    lea dx,newline
    int 21h
    lea si,in1+2
    lea di,rev
    pop cx
    repe cmpsb
    je palin
    lea dx,palin2
    int 21h
          
exit:
   mov ah,4ch
   int 21h
palin:
    mov ah,9
    lea dx,palin1
    int 21h
    jmp exit
end start
