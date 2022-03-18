.data 
    c: .asciiz "abcdef"
    m: .word 11148
    newline: .asciiz "\n"
.text
    .globl main
    main:

    # -------------------------------- #

        # Asignamos la variable m
        lw $t0, m

        # Realizamos la division entre 8
        div $t1, $t0, 8

        # Realizamos la division entre 4
        div $t2, $t0, 4

        # Realizamos la division entre 2
        div $t3, $t0, 2


        # Escribimos los resultados 

        # 1ra division
        li $v0, 1
        move $a0, $t1
        syscall

        # Salto de linea
        li $v0, 4
        la $a0, newline
        syscall

        # 2da division
        li $v0, 1
        move $a0, $t2
        syscall

        # Salto de linea
        li $v0, 4
        la $a0, newline
        syscall

        # 3ra division
        li $v0, 1
        move $a0, $t3
        syscall

        # Salto de linea
        li $v0, 4
        la $a0, newline
        syscall

        # Terminamos el programa
        li $v0, 10
        syscall



