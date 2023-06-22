.data
msg1 db "press h to hide name","$"
msg2 db "alvin petina","$"
.code
main:
mov ax,@data
mov ds,ax

mov ah,09
lea dx,msg1
int 21h

mov ah,02
mov bh,00
mov dl,37
mov dh,20
int 10h

mov ah,09
lea dx,msg2
int 21h

mov ax,0b800h
mov es,ax

mov ah,00
int 16h

hidemain:
cmp al,'h'
je hide

hide:
mov ah,06
mov bh,02fh
mov cl,
mov ch,
mov dl,
mov dh,
int 10h
jmp hidemain

end main