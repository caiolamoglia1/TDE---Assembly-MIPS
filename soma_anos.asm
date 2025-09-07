# PROGRAMA 2: SOMA SIMPLES DE ANOS
# Soma os anos de nascimento dos integrantes do grupo
# Para trabalho individual: soma com 2025

.data
    # IMPORTANTE: Substitua pelos anos reais do seu grupo!
    # Se estiver fazendo sozinho, use apenas o ano 2025
    ano1: .word 2005    # Ano de nascimento do Caio
    ano2: .word 2006    # Ano de nascimento do Gastão
    
    # Mensagens para o usuário
    msg_anos: .asciiz "Anos de nascimento: "
    msg_soma: .asciiz "\nSoma total: "
    espaco: .asciiz " "
    quebra: .asciiz "\n"

.text
.globl main

main:
    # Carrega os 2 anos nos registradores
    lw $t0, ano1    # $t0 = primeiro ano
    lw $t1, ano2    # $t1 = segundo ano
    
    # Mostra os anos que estamos somando
    li $v0, 4
    la $a0, msg_anos
    syscall
    
    # Imprime primeiro ano
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    # Imprime segundo ano
    li $v0, 1
    move $a0, $t1
    syscall
    
    # CÁLCULO DA SOMA
    # Soma os dois anos em $t2
    add $t2, $t0, $t1    # $t2 = ano1 + ano2
    
    # Mostra o resultado
    li $v0, 4
    la $a0, msg_soma
    syscall
    
    # Imprime a soma final
    li $v0, 1
    move $a0, $t2
    syscall
    
    # Quebra de linha final
    li $v0, 4
    la $a0, quebra
    syscall
    
    # Termina o programa
    li $v0, 10
    syscall
