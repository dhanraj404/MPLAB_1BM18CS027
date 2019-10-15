.model small
display macro msg
 lea dx,msg
 mov ah,09h
 int 21h
endm
.data
  msg1 db 0dh,0ah,"Enter first string..$"
  msg2 db 0dh,0ah,"Enter second string..$"
  msg3 db 0dh,0ah,"Strings are equal$"
  msg4 db 0dh,0ah,"Strings are unequal$"
  str1 db 10h dup(0)
  str2 db 10h dup(0)
  len1 dw 00h
  len2 dw 00h
.code
    mov ax, @data
    mov ds, ax
    mov es, ax
    display msg1
    mov si, 00h
Back1:
    mov ah, 01h
    int 21h
    cmp al,0dh
    jz Second
    mov str1[si],al
    inc si
    inc len1
    jmp Back1
Second:
    display msg2
    mov di,00h
Back2:
    mov ah, 01h
    int 21h
    cmp al,0dh
    jz Next
    mov str2[di],al
    inc di
    inc len2
    jmp Back2
Next:    
    mov ax, len1
    mov bx, len2
    cmp ax, bx
    jne Not_Equal
    repe cmpsb
    jne Not_Equal
    jmp Equal
Not_Equal:
       display msg4      
       jmp Exit
Equal:
       display msg3
Exit:
       mov ah, 4ch
       int 21h
end
