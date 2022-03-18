.data 
    c: .asciiz "abcdef"
    m: .word 11148
    a: .word 5
    newline: .asciiz "\n"
.text
    .globl main
    main:

        # Asignamos el valor de a 
        lw $a1, a

        # Asignamos la variable m
        lw $t0, m

        # Realizamos la division entre 8
        div $t1, $t0, 8

        # Realizamos la division entre 4
        div $t2, $t0, 4

        # Realizamos la division entre 2
        div $t3, $t0, 2

        # Llamamos a la funcion
        jal div4
        
        # Escribimos el resultado de la funcion
        li $v0, 1
        move $a0, $v1  
        syscall

        # Salto de linea
        li $v0, 4
        la $a0, newline
        syscall

        # Terminamos el programa
        li $v0, 10
        syscall

        div4:
            div $v1, $a1, 4
            jr $ra
