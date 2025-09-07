
# Resultado esperado: 1,2,3,4,5,9

.data
    array: .word 4, 3, 9, 5, 2, 1    # Array inicial
    tamanho: .word 6                  # Tamanho do array
    espaco: .asciiz " "               # Espaço para separar números
    quebra: .asciiz "\n"              # Quebra de linha

.text
.globl main

main:
    # Carrega endereço base do array e tamanho
    la $t0, array        # $t0 = endereço base do array
    lw $t1, tamanho      # $t1 = tamanho do array (6)
    
    # Implementação do Bubble Sort
    addi $s0, $zero, 0   # i = 0 (contador externo)
    
loop_externo:
    beq $s0, $t1, imprimir    # Se i == tamanho, vai para impressão
    
    addi $s1, $zero, 0        # j = 0 (contador interno)
    sub $s2, $t1, $s0         # $s2 = tamanho - i
    addi $s2, $s2, -1         # $s2 = tamanho - i - 1
    
loop_interno:
    beq $s1, $s2, proximo_i   # Se j == (tamanho-i-1), próxima iteração externa
    
    # Calcula endereços dos elementos array[j] e array[j+1]
    sll $t2, $s1, 2          # $t2 = j * 4 (offset)
    add $t3, $t0, $t2        # $t3 = endereço de array[j]
    addi $t4, $t3, 4         # $t4 = endereço de array[j+1]
    
    # Carrega valores
    lw $t5, 0($t3)           # $t5 = array[j]
    lw $t6, 0($t4)           # $t6 = array[j+1]
    
    # Compara e troca se necessário
    ble $t5, $t6, nao_troca  # Se array[j] <= array[j+1], não troca
    
    # Troca os elementos
    sw $t6, 0($t3)           # array[j] = array[j+1]
    sw $t5, 0($t4)           # array[j+1] = array[j]
    
nao_troca:
    addi $s1, $s1, 1         # j++
    j loop_interno
    
proximo_i:
    addi $s0, $s0, 1         # i++
    j loop_externo

imprimir:
    # Imprime o array ordenado
    addi $s0, $zero, 0       # i = 0
    
loop_impressao:
    beq $s0, $t1, fim        # Se i == tamanho, termina
    
    # Calcula endereço do elemento
    sll $t2, $s0, 2          # $t2 = i * 4
    add $t3, $t0, $t2        # $t3 = endereço de array[i]
    lw $t4, 0($t3)           # $t4 = array[i]
    
    # Imprime o número
    li $v0, 1                # Syscall para imprimir inteiro
    move $a0, $t4            # Valor a ser impresso
    syscall
    
    # Imprime espaço (exceto no último elemento)
    addi $t5, $t1, -1        # $t5 = tamanho - 1
    beq $s0, $t5, sem_espaco # Se é o último elemento, não imprime espaço
    
    li $v0, 4                # Syscall para imprimir string
    la $a0, espaco           # Carrega espaço
    syscall
    
sem_espaco:
    addi $s0, $s0, 1         # i++
    j loop_impressao

fim:
    # Imprime quebra de linha
    li $v0, 4
    la $a0, quebra
    syscall
    
    # Termina o programa
    li $v0, 10
    syscall
