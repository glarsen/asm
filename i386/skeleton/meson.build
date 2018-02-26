project('skeleton', 'c')

asm_sources = ['bare.asm']

nasm = find_program('nasm')

asm_gen = generator(nasm,
    output  : '@BASENAME@.o',
    arguments : ['-f', 'elf', '@INPUT@', '-o', '@OUTPUT@'])

asm_objs = asm_gen.process(asm_sources)

executable('skeleton', asm_objs,
    link_args: ['-m32', '-nostdlib'])
