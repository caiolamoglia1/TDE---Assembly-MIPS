
# PROGRAMA 1: ORDENAÇÃO SIMPLES
# Ordena os números: 4, 3, 9, 5, 2, 1
# Resultado esperado: 1, 2, 3, 4, 5, 9

.data
    # Nossos 6 números para ordenar
    num1: .word 4
    num2: .word 3  
    num3: .word 9
    num4: .word 5
    num5: .word 2
    num6: .word 1
    
    # Mensagens para o usuário
    msg_inicio: .asciiz "Sequencia original: 4 3 9 5 2 1\n"
    msg_resultado: .asciiz "Sequencia ordenada: "
    espaco: .asciiz " "
    quebra: .asciiz "\n"

.text
.globl main

main:
    # Mostra a sequência original
    li $v0, 4
    la $a0, msg_inicio
    syscall
    
    # Carrega os 6 números nos registradores
    lw $t0, num1    # $t0 = 4
    lw $t1, num2    # $t1 = 3
    lw $t2, num3    # $t2 = 9
    lw $t3, num4    # $t3 = 5
    lw $t4, num5    # $t4 = 2
    lw $t5, num6    # $t5 = 1
    
    # ORDENAÇÃO SIMPLES - Comparamos todos os pares
    # Compara $t0 com $t1 (4 com 3)
    ble $t0, $t1, pula1
    # Troca se $t0 > $t1
    move $t6, $t0
    move $t0, $t1
    move $t1, $t6
    
pula1:
    
    # Compara $t0 com $t2 (primeiro com terceiro)
    ble $t0, $t2, pula2
    move $t6, $t0
    move $t0, $t2
    move $t2, $t6
    
pula2:
    # Compara $t0 com $t3
    ble $t0, $t3, pula3
    move $t6, $t0
    move $t0, $t3
    move $t3, $t6
    
pula3:
    # Compara $t0 com $t4
    ble $t0, $t4, pula4
    move $t6, $t0
    move $t0, $t4
    move $t4, $t6
    
pula4:
    # Compara $t0 com $t5
    ble $t0, $t5, pula5
    move $t6, $t0
    move $t0, $t5
    move $t5, $t6
    
pula5:
    # Agora $t0 tem o menor número
    # Vamos ordenar os outros 5 números ($t1 a $t5)
    
    # Compara $t1 com $t2
    ble $t1, $t2, pula6
    move $t6, $t1
    move $t1, $t2
    move $t2, $t6
    
pula6:
    # Compara $t1 com $t3
    ble $t1, $t3, pula7
    move $t6, $t1
    move $t1, $t3
    move $t3, $t6
    
pula7:
    # Compara $t1 com $t4
    ble $t1, $t4, pula8
    move $t6, $t1
    move $t1, $t4
    move $t4, $t6
    
pula8:
    # Compara $t1 com $t5
    ble $t1, $t5, pula9
    move $t6, $t1
    move $t1, $t5
    move $t5, $t6
    
pula9:
    # Agora $t1 tem o segundo menor
    # Continua ordenando os outros 4 números
    
    # Compara $t2 com $t3
    ble $t2, $t3, pula10
    move $t6, $t2
    move $t2, $t3
    move $t3, $t6
    
pula10:
    # Compara $t2 com $t4
    ble $t2, $t4, pula11
    move $t6, $t2
    move $t2, $t4
    move $t4, $t6
    
pula11:
    # Compara $t2 com $t5
    ble $t2, $t5, pula12
    move $t6, $t2
    move $t2, $t5
    move $t5, $t6
    
pula12:
    # Agora $t2 tem o terceiro menor
    # Ordena os últimos 3 números
    
    # Compara $t3 com $t4
    ble $t3, $t4, pula13
    move $t6, $t3
    move $t3, $t4
    move $t4, $t6
    
pula13:
    # Compara $t3 com $t5
    ble $t3, $t5, pula14
    move $t6, $t3
    move $t3, $t5
    move $t5, $t6
    
pula14:
    # Finalmente, compara os dois últimos
    # Compara $t4 com $t5
    ble $t4, $t5, imprimir
    move $t6, $t4
    move $t4, $t5
    move $t5, $t6

imprimir:
    # Mostra mensagem do resultado
    li $v0, 4
    la $a0, msg_resultado
    syscall
    
    # Imprime os números ordenados
    # Primeiro número ($t0)
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    # Segundo número ($t1)
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    # Terceiro número ($t2)
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    # Quarto número ($t3)
    li $v0, 1
    move $a0, $t3
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    # Quinto número ($t4)
    li $v0, 1
    move $a0, $t4
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    # Sexto número ($t5)
    li $v0, 1
    move $a0, $t5
    syscall

fim:
    # Quebra de linha final
    li $v0, 4
    la $a0, quebra
    syscall
    
    # Termina o programa
    li $v0, 10
    syscall
