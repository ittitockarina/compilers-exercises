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
        div $t1, $t0, 8   # Comando div: dividimos t0 entre 0 y el resultado lo guardamos en t1
                          # Estamos realizando division entera, para flotantes ya se usa otro comandos
        
        li $v0, 1
        move $a0, $t1
        syscall

        # Salto de linea
        li $v0, 4
        la $a0, newline
        syscall

        # Terminamos el programa
        li $v0, 10
        syscall


