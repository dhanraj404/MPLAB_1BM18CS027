;program to display time
.model small
.code
mov ah,2ch
int 21h
mov al,ch
aam
mov bx,ax
call display
mov dl,20h
mov ah,02h
int 21h
mov al,cl
aam
mov bx,ax
call display
mov dl,20h
mov ah,02h
int 21h
mov al,dh
aam
mov bx,ax
call display
mov dl,20h
mov ah,02h
int 21h
mov ah,4ch
int 21h

display proc near
mov dl,bh
add dl,30h
mov ah,02h
int 21h
mov dl,bl
add dl,30h
mov ah,02h
int 21h
ret
display endp
end
