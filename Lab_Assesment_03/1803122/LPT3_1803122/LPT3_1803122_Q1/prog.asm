.686 
.model flat, c 
include C:\masm32\include\msvcrt.inc 
includelib C:\masm32\lib\msvcrt.lib 
 
.stack 100h 
printf PROTO arg1:Ptr Byte, printlist:VARARG 
scanf PROTO arg2:Ptr Byte, inputlist:VARARG 
 
.data 
input_integer_format byte "%d",0 
output_msg_format byte "%s",0 
output_integer_msg_format byte "%d", 0Ah, 0 

;variable
A sdword 30

.code 
main proc 

while_loop:
    mov eax, A
    cmp eax, 20
    jle EXIT
    sub eax, 1
    mov A, eax
    jmp PRINT

PRINT: 
    push eax 
    push ebx 
    push ecx 
    push edx 
    push ebp 
    INVOKE printf, ADDR output_integer_msg_format, eax
    pop ebp 
    pop edx 
    pop ecx 
    pop ebx 
    pop eax
    jmp while_loop 
 
EXIT: 
 
main endp 
end