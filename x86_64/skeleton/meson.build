project('skeleton', 'c')

asm_sources = ['bare.asm']

nasm = find_program('nasm')

asm_gen = generator(nasm,
    output  : '@BASENAME@.o',
    arguments : ['-f', 'elf64', '@INPUT@', '-o', '@OUTPUT@'])

asm_objs = asm_gen.process(asm_sources)

executable('skeleton', asm_objs,
    link_args: ['-nostdlib'])
