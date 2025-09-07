# Programa 2: Soma de anos de nascimento
# Para grupos: soma os anos de nascimento dos integrantes
# Para trabalho individual: soma com 2025

.data
    # Substitua os valores abaixo pelos anos de nascimento dos integrantes do grupo
    # Se estiver fazendo sozinho, use apenas 2025
    anos: .word 2000, 2001, 1999, 2025    # Exemplo: 4 anos (grupo de 4 pessoas)
    quantidade: .word 4                     # Quantidade de anos no array
    
    msg_resultado: .asciiz "Soma dos anos de nascimento: "
    quebra: .asciiz "\n"

.text
.globl main

main:
    # Carrega endereço base do array e quantidade
    la $t0, anos             # $t0 = endereço base do array de anos
    lw $t1, quantidade       # $t1 = quantidade de anos
    
    # Inicializa soma
    addi $s0, $zero, 0       # $s0 = soma (inicializada em 0)
    addi $s1, $zero, 0       # $s1 = contador (i = 0)
    
loop_soma:
    beq $s1, $t1, imprimir_resultado    # Se i == quantidade, vai para impressão
    
    # Calcula endereço do elemento atual
    sll $t2, $s1, 2          # $t2 = i * 4 (offset)
    add $t3, $t0, $t2        # $t3 = endereço de anos[i]
    lw $t4, 0($t3)           # $t4 = anos[i]
    
    # Adiciona à soma
    add $s0, $s0, $t4        # soma += anos[i]
    
    # Incrementa contador
    addi $s1, $s1, 1         # i++
    j loop_soma

imprimir_resultado:
    # Imprime mensagem
    li $v0, 4                # Syscall para imprimir string
    la $a0, msg_resultado    # Carrega mensagem
    syscall
    
    # Imprime o resultado da soma
    li $v0, 1                # Syscall para imprimir inteiro
    move $a0, $s0            # Valor da soma
    syscall
    
    # Imprime quebra de linha
    li $v0, 4
    la $a0, quebra
    syscall
    
    # Termina o programa
    li $v0, 10
    syscall
