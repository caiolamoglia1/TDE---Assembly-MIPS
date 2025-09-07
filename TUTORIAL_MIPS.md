# Tutorial Completo: Programação MIPS com Simulador MARS

## 📋 Índice
1. [Introdução ao MARS](#introdução)
2. [Conceitos Básicos](#conceitos-básicos)
3. [Exemplos Práticos Passo a Passo](#exemplos-práticos)
4. [Aplicação nos Nossos Programas](#aplicação-nos-nossos-programas)
5. [Dicas de Debugging](#dicas-de-debugging)

---

## 🎯 Introdução

Este tutorial é destinado a iniciantes em programação MIPS usando o simulador MARS. 
**Execute cada código fornecido passo a passo** e observe os valores dos registradores 
e endereços de memória mostrados no simulador durante cada etapa.

### 🔧 Como usar este tutorial:
1. Abra o simulador MARS
2. Digite cada código de exemplo
3. Execute passo a passo (F10)
4. Observe as mudanças nos registradores
5. Compare com as explicações fornecidas

---

## 📚 Conceitos Básicos

### Seções do Código MIPS:
- **`.data`** - Armazena variáveis e constantes
- **`.text`** - Contém as instruções do programa
- **`.globl main`** - Define o ponto de entrada do programa

### Registradores Importantes:
- **`$v0`** - Código do sistema para syscalls
- **`$a0-$a3`** - Argumentos para syscalls e funções
- **`$t0-$t9`** - Registradores temporários
- **`$s0-$s7`** - Registradores salvos
- **`$ra`** - Endereço de retorno

### Códigos de Sistema (Syscalls):
- **1** - Imprimir inteiro
- **4** - Imprimir string
- **5** - Ler inteiro
- **10** - Terminar programa
- **11** - Imprimir caractere

---

## 💡 Exemplos Práticos Passo a Passo

### 1. 🔤 Imprimindo um Caractere

```assembly
.data
character: .byte 'a'    # Define o caractere 'a' na memória

.text
li $v0, 11             # 11 = código para imprimir caractere
la $a0, character      # Carrega endereço do caractere em $a0
syscall                # Chama o sistema para imprimir
```

**O que acontece:**
- `li $v0, 11` → Registrador $v0 recebe o valor 11
- `la $a0, character` → $a0 recebe o endereço onde 'a' está armazenado
- `syscall` → Sistema imprime o caractere

---

### 2. 🔢 Imprimindo um Número

```assembly
.data
age: .word 21          # Define o número 21 na memória

.text
li $v0, 1              # 1 = código para imprimir inteiro
lw $a0, age            # Carrega o valor 21 em $a0
syscall                # Chama o sistema para imprimir
```

**Diferença importante:** 
- `la` carrega o **endereço**
- `lw` carrega o **valor**

---

### 3. ➕ Somando Dois Números

```assembly
.data
num1: .word 2          # Primeiro número
num2: .word 3          # Segundo número

.text
lw $t0, num1           # $t0 = 2
lw $t1, num2           # $t1 = 3
add $t2, $t0, $t1      # $t2 = $t0 + $t1 = 5

# Imprime o resultado
li $v0, 1              # Código para imprimir inteiro
move $a0, $t2          # Move resultado para $a0
syscall                # Imprime a soma
```

**Observação:** Acompanhe como os valores mudam nos registradores $t0, $t1 e $t2.

---

### 4. ✖️ Multiplicando Dois Números

```assembly
.data

.text
addi $t0, $zero, 10    # $t0 = 0 + 10 = 10
addi $t1, $zero, 4     # $t1 = 0 + 4 = 4
mult $t0, $t1          # Multiplica $t0 × $t1
mflo $s0               # Move resultado de LO para $s0

# Imprime o resultado
li $v0, 1              # Código para imprimir inteiro
move $a0, $s0          # Move resultado para $a0
syscall                # Imprime o produto
```

**Importante:** `mult` armazena o resultado nos registradores HI e LO.

---

### 5. 📝 Obtendo Entrada do Usuário

```assembly
.data
prompt: .asciiz "Digite sua idade: "
message: .asciiz "\nSua idade é: "

.text
# Exibe prompt
li $v0, 4              # Código para imprimir string
la $a0, prompt         # Carrega endereço da mensagem
syscall                # Imprime prompt

# Lê entrada do usuário
li $v0, 5              # Código para ler inteiro
syscall                # Lê do teclado
move $t0, $v0          # Salva entrada em $t0

# Exibe resultado
li $v0, 4              # Código para imprimir string
la $a0, message        # Carrega mensagem
syscall                # Imprime mensagem

li $v0, 1              # Código para imprimir inteiro
move $a0, $t0          # Move idade para $a0
syscall                # Imprime a idade
```

---

### 6. 🔀 Instruções de Desvio (If)

```assembly
.data
message: .asciiz "Os números são diferentes!\n"

.text
addi $t0, $zero, 5     # $t0 = 5
addi $t1, $zero, 20    # $t1 = 20

# Se $t0 ≠ $t1, vai para 'diferentes'
bne $t0, $t1, diferentes

# Se chegou aqui, são iguais
li $v0, 10             # Código para sair
syscall

diferentes:
li $v0, 4              # Código para imprimir string
la $a0, message        # Carrega mensagem
syscall                # Imprime mensagem

li $v0, 10             # Código para sair
syscall
```

**Outras instruções de desvio:**
- `beq` - branch if equal (desvia se igual)
- `bgt` - branch if greater than (desvia se maior)
- `blt` - branch if less than (desvia se menor)

---

### 7. 🔄 Usando Loops (While)

```assembly
.data
message1: .asciiz "Contador: "
message2: .asciiz "\nLoop finalizado!\n"
quebra: .asciiz "\n"

.text
addi $t0, $zero, 1     # $t0 = contador = 1

while:
bgt $t0, 10, sair      # Se contador > 10, sai do loop

# Imprime mensagem e contador
li $v0, 4
la $a0, message1
syscall

li $v0, 1
move $a0, $t0
syscall

li $v0, 4
la $a0, quebra
syscall

addi $t0, $t0, 1       # contador++
j while                # Volta para o início do loop

sair:
li $v0, 4
la $a0, message2
syscall

li $v0, 10             # Termina programa
syscall
```

---

### 8. 📞 Chamando Funções

```assembly
.data

.text
main:
addi $a1, $zero, 50    # Primeiro argumento = 50
addi $a2, $zero, 100   # Segundo argumento = 100
jal somar              # Chama função 'somar'

# Imprime resultado retornado em $v1
li $v0, 1
move $a0, $v1
syscall

li $v0, 10             # Termina programa
syscall

somar:
add $v1, $a1, $a2      # $v1 = $a1 + $a2 (resultado)
jr $ra                 # Retorna para quem chamou
```

**Convenções:**
- `$a0-$a3` - Argumentos de entrada
- `$v0-$v1` - Valores de retorno
- `$ra` - Endereço de retorno

---

## 🎯 Aplicação nos Nossos Programas

### Como nosso programa de **Ordenação** funciona:

```assembly
# Carrega os números
lw $t0, num1    # $t0 = 4
lw $t1, num2    # $t1 = 3

# Compara e troca se necessário
ble $t0, $t1, pula1    # Se $t0 ≤ $t1, não troca
# Senão, troca:
move $t6, $t0          # $t6 = $t0 (backup)
move $t0, $t1          # $t0 = $t1
move $t1, $t6          # $t1 = $t6 (backup)
```

### Como nosso programa de **Soma** funciona:

```assembly
# Carrega os anos
lw $t0, ano1    # $t0 = primeiro ano
lw $t1, ano2    # $t1 = segundo ano
lw $t2, ano3    # $t2 = terceiro ano
lw $t3, ano4    # $t3 = quarto ano

# Soma tudo
add $t4, $t0, $t1    # $t4 = ano1 + ano2
add $t4, $t4, $t2    # $t4 = $t4 + ano3
add $t4, $t4, $t3    # $t4 = $t4 + ano4
```

---

## 🐛 Dicas de Debugging no MARS

### 1. **Execute Passo a Passo (F10)**
- Permite ver cada instrução sendo executada
- Observe mudanças nos registradores em tempo real

### 2. **Monitore a Aba "Registers"**
- Veja valores de $t0, $t1, etc.
- Compare com valores esperados

### 3. **Use a Aba "Data Segment"**
- Veja conteúdo da memória de dados
- Confirme se variáveis têm valores corretos

### 4. **Breakpoints**
- Clique na linha para criar um breakpoint
- Execute até aquele ponto (F5)

### 5. **Console de Saída**
- Veja resultados dos `syscall`
- Confirme se saída está correta

---

## ⚠️ Erros Comuns e Soluções

### 1. **"Label not found"**
```assembly
# ❌ Erro: label não definido
j minha_funcao

# ✅ Correto: definir o label
minha_funcao:
    # código aqui
```

### 2. **"Runtime exception"**
```assembly
# ❌ Erro: divisão por zero
div $t0, $zero

# ✅ Correto: verificar antes
bne $t1, $zero, pode_dividir
# tratar erro aqui
pode_dividir:
div $t0, $t1
```

### 3. **Valores incorretos**
```assembly
# ❌ Erro: usar 'la' para valor
la $t0, numero    # Carrega endereço

# ✅ Correto: usar 'lw' para valor
lw $t0, numero    # Carrega valor
```

---

## 📝 Exercícios Práticos

### Exercício 1: Calculadora Simples
Crie um programa que:
1. Leia dois números do usuário
2. Some, subtraia, multiplique
3. Exiba todos os resultados

### Exercício 2: Contador Regressivo
Crie um programa que:
1. Leia um número N
2. Conte de N até 1
3. Exiba "Acabou!" no final

### Exercício 3: Maior de Três
Crie um programa que:
1. Tenha três números na memória
2. Encontre o maior
3. Exiba o resultado

---

## 🚀 Próximos Passos

1. **Pratique cada exemplo** deste tutorial
2. **Modifique os códigos** para entender melhor
3. **Execute nossos programas** do TDE no MARS
4. **Grave o vídeo** explicando o funcionamento
5. **Teste diferentes valores** para confirmar que funciona

---

## 📚 Recursos Adicionais

- **Manual do MARS**: Ajuda → Help
- **Referência MIPS**: F1 no MARS
- **Exemplos**: Arquivo → Open → samples
- **Debugging**: Tools → Debugging

---

*Este tutorial foi criado para auxiliar no desenvolvimento dos programas do TDE de Assembly MIPS. Use-o como referência durante a programação e gravação do vídeo explicativo.*
