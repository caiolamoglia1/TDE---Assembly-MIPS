# PROGRAMA 2: SOMA SIMPLES DE ANOS
# Soma os anos de nascimento dos integrantes do grupo
# Para trabalho individual: soma com 2025

.data
    # IMPORTANTE: Substitua pelos anos reais do seu grupo!
    # Se estiver fazendo sozinho, use apenas o ano 2025
    ano1: .word 2000    # Ano de nascimento do integrante 1
    ano2: .word 2001    # Ano de nascimento do integrante 2  
    ano3: .word 1999    # Ano de nascimento do integrante 3
    ano4: .word 2025    # Para trabalho individual ou 4º integrante
    
    # Mensagens para o usuário
    msg_anos: .asciiz "Anos de nascimento: "
    msg_soma: .asciiz "\nSoma total: "
    espaco: .asciiz " "
    quebra: .asciiz "\n"

.text
.globl main

main:
    # Carrega os 4 anos nos registradores
    lw $t0, ano1    # $t0 = primeiro ano
    lw $t1, ano2    # $t1 = segundo ano
    lw $t2, ano3    # $t2 = terceiro ano
    lw $t3, ano4    # $t3 = quarto ano
    
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
    li $v0, 4
    la $a0, espaco
    syscall
    
    # Imprime terceiro ano
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    # Imprime quarto ano
    li $v0, 1
    move $a0, $t3
    syscall
    
    # CÁLCULO DA SOMA
    # Soma tudo em $t4
    add $t4, $t0, $t1    # $t4 = ano1 + ano2
    add $t4, $t4, $t2    # $t4 = $t4 + ano3
    add $t4, $t4, $t3    # $t4 = $t4 + ano4
    
    # Mostra o resultado
    li $v0, 4
    la $a0, msg_soma
    syscall
    
    # Imprime a soma final
    li $v0, 1
    move $a0, $t4
    syscall
    
    # Quebra de linha final
    li $v0, 4
    la $a0, quebra
    syscall
    
    # Termina o programa
    li $v0, 10
    syscall
