.org $0x7C00
.code16

.text

.global start

start:
    cli
    xorw %ax, %ax
    movw %ax, %ds
    movw %ax, %es
    movw %ax, %ss
    mov $0x7C00, %sp
    mov $hello, %si

print:
    lodsb
    or %al, %al
    jz done
    mov $0x0E, %ah
    int $0x10
    jmp print

done:
    ret

hello:
    .asciz "Hello world!\n"

. = start + 510
.word 0xAA55
