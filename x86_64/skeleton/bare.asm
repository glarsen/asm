section .data
section .rodata
section .bss
section .text

  global _start
_start:
  nop

_exit:
  mov rax, 0x3c  ; exit
  mov rdi, 1     ; return code = 0
  syscall
