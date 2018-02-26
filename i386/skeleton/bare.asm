section .data
section .rodata
section .bss
section .text

  global _start
_start:
  nop

_exit:
  mov eax, 1  ; exit
  mov ebx, 0  ; return code = 0
  int 80h
