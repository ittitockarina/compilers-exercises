.data
    c: .asciiz "abcdef"
    m: .word 11148
    A: .word 5
    B: .word 4
    newline: .asciiz "\n"
.text
    .globl main 
    main:

        # Cargamos la variable m
        lw $t0, m

        # Realizamos la division entre 8
        div $t1, $t0, 8

        # Realizamos la division entre 4
        div $t2, $t0, 4

        # Realizamos la division entre 2
        div $t3, $t0, 2

        # Cargamos las variables a, b
        lw $a1, A
        lw $a2, B

        # Llamamos a la funcion divv(a,b)
        jal divv

        # Escribimos resultado de divv(a,b)
        li $v0, 1
        move $a0, $v1
        syscall

        # Salto de linea
        li $v0, 4
        la $a0, newline
        syscall

        # Llamamos a la funcion div(a)
        jal div4

        # Escribimos resiltado de div(a)
        li $v0, 1
        move $a0, $v1
        syscall

        # Salto de linea
        li $v0, 4
        la $a0, newline
        syscall

        # Terminamos programa
        li $v0, 10
        syscall

    divv:
        div $v1, $a1, $a2
        jr $ra
    div4:
        div $v1, $a1, 4
        jr $ra