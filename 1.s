# Segun lo que lei cada programa en assembler mips tiene dos partes
 
# 1. .data: Aqui es donde vienen nuestros datos o donde declaramos nuestras variables
# 2. .text: Aqui vienen las instrucciones del programa
# -- Para declarar un string usamos codigo aski (asciiz) "Aqui es la parte donde estoy dudando
#     no encontre otra forma de declarar un string, pero creo esta bien"
# -- Para declarar un entero usamos la palabra .word que practicamente lo que dice es (guarda esta
#     palabra con este valor, en nuestro caso le estamos diciendo que guarde la palabra m con el 
#     valor inicial de 11148)


.data 
    c: .asciiz "abcdef"
    m: .word 11148
    newline: .asciiz "\n"
  
.text
    .globl main
    main:

       # Ahora para poder escrivir un string solo con comandos, pero siempre se prepara a la maquina
       # o sistema 

        # Escribimos c 
        li $v0, 4      # Con esta linea le decimos al sistema que se prepare porque va a escribir algo
        la $a0, c      # v0 indica la preparacion y el 4 significa que lo que va a escribir va a ser un string 
        syscall        # luego le mandamos la direccion de lo que vamos a escribir con el comando $a0, c
                       # Y para finalizar con "syscall" le decimos que lo haga ya 

        # Salto de linea
        li $v0, 4
        la $a0, newline
        syscall

    # -------------------------------- #

        # Asignamos la variable m a un temporal
        lw $t0, m      # lw: load word, cargamos el valor de una palabra en este caso "m" (su valor)
                       # y lo colocamos dentro de la variable temporal t0

        # Mostramos la variable m
        li $v0, 1       # En este caso ya no escribiremos un string, sino un entero por eso se usa el 1
        move $a0, $t0   # Y como es un entero tenemos que mandarlo al registro $a0 con el comando move
        syscall         # De t0 (temporal 0) lo pasamos a a0 y una vez hecho eso hacemos la llamada con syscall

        # Salto de linea
        li $v0, 4
        la $a0, newline
        syscall

        # Terminamos el programa
        li $v0, 10      # Comando para terminar el programa
        syscall
