stack segment
stack ends

data segment
        str1 db \'Assemblers$\'

        msg1 db \'found$\'
        msg2 db \'not found$\'
data ends

ptrf macro msg
  lea dx,msg
  mov ah,09h
  int 21h
endm

code segment

        assume cs:code,ds:data,ss:stack

  start:
      mov ax,data
      mov ds,ax


  main proc near
        cld
        mov cx,10
        mov al,\'A\'
        lea di,str1

        repne scasb
        jne notfound
        ptrf msg1

 close:
        mov ax,4c00h
        int 21h

 notfound:
        ptrf msg2
        mov ax,4c00h
        int 21h

  main endp
 code ends

   end start
