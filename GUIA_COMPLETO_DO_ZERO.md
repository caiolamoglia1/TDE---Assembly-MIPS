# 🎓 GUIA COMPLETO DO ZERO: TDE Assembly MIPS

## 📋 ÍNDICE
1. [Preparação do Ambiente](#1-preparação-do-ambiente)
2. [Primeiros Passos no MARS](#2-primeiros-passos-no-mars)
3. [Aprendendo Assembly Básico](#3-aprendendo-assembly-básico)
4. [Desenvolvendo o Programa 1 - Ordenação](#4-programa-1---ordenação)
5. [Desenvolvendo o Programa 2 - Soma](#5-programa-2---soma)
6. [Testando os Programas](#6-testando-os-programas)
7. [Criando o Repositório GitHub](#7-criando-o-repositório-github)
8. [Gravando o Vídeo](#8-gravando-o-vídeo)
9. [Entrega Final](#9-entrega-final)

---

## 1. 🔧 PREPARAÇÃO DO AMBIENTE

### Passo 1.1: Baixar o MARS
1. **Acesse:** http://courses.missouristate.edu/KenVollmar/mars/
2. **Clique em:** "Download MARS"
3. **Baixe:** `Mars4_5.jar` (versão mais recente)
4. **Salve em:** Uma pasta fácil de encontrar (ex: `C:\MARS`)

### Passo 1.2: Instalar Java (se necessário)
1. **Verifique se tem Java:** Abra o cmd e digite `java -version`
2. **Se não tiver:** Baixe em https://www.java.com/
3. **Instale normalmente**

### Passo 1.3: Executar o MARS
1. **Navegue até a pasta** onde salvou o Mars4_5.jar
2. **Duplo clique** no arquivo `Mars4_5.jar`
3. **OU abra o cmd** na pasta e digite: `java -jar Mars4_5.jar`

✅ **Checkpoint:** O MARS deve abrir com uma interface gráfica.

---

## 2. 🖥️ PRIMEIROS PASSOS NO MARS

### Passo 2.1: Conhecendo a Interface
Quando o MARS abrir, você verá:
- **Edit Tab:** Onde você escreve o código
- **Execute Tab:** Onde você roda o programa
- **Registers:** Mostra valores dos registradores
- **Data Segment:** Mostra valores na memória

### Passo 2.2: Seu Primeiro Programa
**Digite este código simples na aba Edit:**

```assembly
.data
mensagem: .asciiz "Olá, MIPS!"

.text
.globl main
main:
    # Imprime a mensagem
    li $v0, 4          # Código 4 = imprimir string
    la $a0, mensagem   # Carrega endereço da mensagem
    syscall            # Chama o sistema
    
    # Termina o programa
    li $v0, 10         # Código 10 = sair
    syscall
```

### Passo 2.3: Executando o Programa
1. **Clique em "Assemble"** (ou pressione F3)
2. **Se der erro:** Verifique se digitou tudo corretamente
3. **Se der certo:** Vá para a aba "Execute"
4. **Clique em "Run"** (ou pressione F5)
5. **Resultado:** Deve aparecer "Olá, MIPS!" na parte inferior

✅ **Checkpoint:** Você executou seu primeiro programa MIPS!

---

## 3. 📚 APRENDENDO ASSEMBLY BÁSICO

### Passo 3.1: Estrutura Básica
Todo programa MIPS tem esta estrutura:

```assembly
.data                  # Seção de dados (variáveis)
   # suas variáveis aqui

.text                  # Seção de código (instruções)
.globl main           # Define ponto de entrada
main:                 # Início do programa principal
   # suas instruções aqui
   
   li $v0, 10         # Sempre termine com isto
   syscall            # Para sair do programa
```

### Passo 3.2: Tipos de Dados
Na seção `.data`, você pode declarar:

```assembly
.data
numero: .word 25           # Número inteiro (32 bits)
letra: .byte 'A'           # Um caractere
texto: .asciiz "Hello"     # String (texto)
decimal: .float 3.14       # Número decimal
```

### Passo 3.3: Registradores Importantes
- **`$t0` a `$t9`:** Registradores temporários (use para cálculos)
- **`$v0`:** Código do sistema (para syscalls)
- **`$a0`:** Argumento para syscalls (o que imprimir)
- **`$zero`:** Sempre vale 0

### Passo 3.4: Instruções Básicas

**Carregar valores:**
```assembly
lw $t0, numero     # Carrega VALOR da variável 'numero'
la $t0, numero     # Carrega ENDEREÇO da variável 'numero'
li $t0, 42         # Carrega o número 42 diretamente
```

**Operações matemáticas:**
```assembly
add $t2, $t0, $t1  # $t2 = $t0 + $t1
sub $t2, $t0, $t1  # $t2 = $t0 - $t1
mult $t0, $t1      # Multiplica $t0 × $t1
```

**Comparações e saltos:**
```assembly
beq $t0, $t1, label    # Se $t0 = $t1, vai para 'label'
bne $t0, $t1, label    # Se $t0 ≠ $t1, vai para 'label'
bgt $t0, $t1, label    # Se $t0 > $t1, vai para 'label'
```

### Passo 3.5: Syscalls (Chamadas do Sistema)
```assembly
# Imprimir número
li $v0, 1              # Código 1 = imprimir inteiro
move $a0, $t0          # Coloca número em $a0
syscall                # Executa

# Imprimir texto
li $v0, 4              # Código 4 = imprimir string
la $a0, minha_string   # Coloca endereço do texto em $a0
syscall                # Executa

# Ler número do usuário
li $v0, 5              # Código 5 = ler inteiro
syscall                # Executa (resultado fica em $v0)
```

---

## 4. 🔢 PROGRAMA 1 - ORDENAÇÃO

### Passo 4.1: Entendendo o Problema
- **Entrada:** 4, 3, 9, 5, 2, 1
- **Saída:** 1, 2, 3, 4, 5, 9
- **Método:** Comparar todos os números e trocar quando necessário

### Passo 4.2: Estratégia Simples
Vamos usar 6 registradores, um para cada número:
- `$t0` = primeiro número
- `$t1` = segundo número
- `$t2` = terceiro número
- `$t3` = quarto número
- `$t4` = quinto número
- `$t5` = sexto número

### Passo 4.3: Algoritmo de Troca
Para trocar dois valores:
```assembly
# Se $t0 > $t1, troca
ble $t0, $t1, nao_troca   # Se $t0 ≤ $t1, não troca
# Senão, troca:
move $t6, $t0             # $t6 = backup de $t0
move $t0, $t1             # $t0 = $t1
move $t1, $t6             # $t1 = backup (era $t0)
nao_troca:
```

### Passo 4.4: Código Completo do Programa 1

**Crie um novo arquivo no MARS e digite:**

```assembly
# PROGRAMA 1: Ordenação dos números 4,3,9,5,2,1
.data
    # Os 6 números para ordenar
    num1: .word 4
    num2: .word 3
    num3: .word 9
    num4: .word 5
    num5: .word 2
    num6: .word 1
    
    # Mensagens
    msg_original: .asciiz "Original: 4 3 9 5 2 1\n"
    msg_ordenado: .asciiz "Ordenado: "
    espaco: .asciiz " "
    quebra: .asciiz "\n"

.text
.globl main
main:
    # Mostra sequência original
    li $v0, 4
    la $a0, msg_original
    syscall
    
    # Carrega os 6 números
    lw $t0, num1    # $t0 = 4
    lw $t1, num2    # $t1 = 3
    lw $t2, num3    # $t2 = 9
    lw $t3, num4    # $t3 = 5
    lw $t4, num5    # $t4 = 2
    lw $t5, num6    # $t5 = 1
    
    # INÍCIO DA ORDENAÇÃO
    # Compara $t0 com todos os outros
    ble $t0, $t1, pula1
    move $t6, $t0
    move $t0, $t1
    move $t1, $t6
pula1:
    ble $t0, $t2, pula2
    move $t6, $t0
    move $t0, $t2
    move $t2, $t6
pula2:
    ble $t0, $t3, pula3
    move $t6, $t0
    move $t0, $t3
    move $t3, $t6
pula3:
    ble $t0, $t4, pula4
    move $t6, $t0
    move $t0, $t4
    move $t4, $t6
pula4:
    ble $t0, $t5, pula5
    move $t6, $t0
    move $t0, $t5
    move $t5, $t6
pula5:
    # Agora $t0 tem o menor número
    
    # Compara $t1 com os restantes
    ble $t1, $t2, pula6
    move $t6, $t1
    move $t1, $t2
    move $t2, $t6
pula6:
    ble $t1, $t3, pula7
    move $t6, $t1
    move $t1, $t3
    move $t3, $t6
pula7:
    ble $t1, $t4, pula8
    move $t6, $t1
    move $t1, $t4
    move $t4, $t6
pula8:
    ble $t1, $t5, pula9
    move $t6, $t1
    move $t1, $t5
    move $t5, $t6
pula9:
    # Agora $t1 tem o segundo menor
    
    # Compara $t2 com os restantes
    ble $t2, $t3, pula10
    move $t6, $t2
    move $t2, $t3
    move $t3, $t6
pula10:
    ble $t2, $t4, pula11
    move $t6, $t2
    move $t2, $t4
    move $t4, $t6
pula11:
    ble $t2, $t5, pula12
    move $t6, $t2
    move $t2, $t5
    move $t5, $t6
pula12:
    # Agora $t2 tem o terceiro menor
    
    # Compara $t3 com os dois últimos
    ble $t3, $t4, pula13
    move $t6, $t3
    move $t3, $t4
    move $t4, $t6
pula13:
    ble $t3, $t5, pula14
    move $t6, $t3
    move $t3, $t5
    move $t5, $t6
pula14:
    # Compara os dois últimos
    ble $t4, $t5, imprimir
    move $t6, $t4
    move $t4, $t5
    move $t5, $t6

imprimir:
    # Mostra resultado
    li $v0, 4
    la $a0, msg_ordenado
    syscall
    
    # Imprime os 6 números ordenados
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    li $v0, 1
    move $a0, $t3
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    li $v0, 1
    move $a0, $t4
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    li $v0, 1
    move $a0, $t5
    syscall
    
    # Quebra de linha
    li $v0, 4
    la $a0, quebra
    syscall
    
    # Termina programa
    li $v0, 10
    syscall
```

### Passo 4.5: Testando o Programa 1
1. **Salve o arquivo** como `ordenacao.asm`
2. **Assemble** (F3)
3. **Execute** (F5)
4. **Resultado esperado:** `Original: 4 3 9 5 2 1` → `Ordenado: 1 2 3 4 5 9`

✅ **Checkpoint:** O programa deve exibir a sequência ordenada corretamente.

---

## 5. ➕ PROGRAMA 2 - SOMA

### Passo 5.1: Entendendo o Problema
- **Objetivo:** Somar anos de nascimento dos integrantes do grupo
- **Para trabalho individual:** Somar com 2025
- **Exemplo:** 2000 + 2001 + 1999 + 2025 = 8025

### Passo 5.2: Estratégia
1. Carregar 4 anos em registradores diferentes
2. Somar tudo em um registrador
3. Exibir os anos individuais e o resultado

### Passo 5.3: Código Completo do Programa 2

**Crie um novo arquivo no MARS e digite:**

```assembly
# PROGRAMA 2: Soma de anos de nascimento
.data
    # MODIFIQUE estes valores pelos anos reais do seu grupo!
    ano1: .word 2000    # Ano do integrante 1
    ano2: .word 2001    # Ano do integrante 2
    ano3: .word 1999    # Ano do integrante 3
    ano4: .word 2025    # Ano do integrante 4 (ou 2025 se individual)
    
    # Mensagens
    msg_anos: .asciiz "Anos de nascimento: "
    msg_soma: .asciiz "\nSoma total: "
    espaco: .asciiz " + "
    igual: .asciiz " = "
    quebra: .asciiz "\n"

.text
.globl main
main:
    # Carrega os 4 anos
    lw $t0, ano1    # $t0 = primeiro ano
    lw $t1, ano2    # $t1 = segundo ano
    lw $t2, ano3    # $t2 = terceiro ano
    lw $t3, ano4    # $t3 = quarto ano
    
    # Mostra os anos
    li $v0, 4
    la $a0, msg_anos
    syscall
    
    # Imprime: ano1 + ano2 + ano3 + ano4 = resultado
    li $v0, 1
    move $a0, $t0
    syscall
    
    li $v0, 4
    la $a0, espaco
    syscall
    
    li $v0, 1
    move $a0, $t1
    syscall
    
    li $v0, 4
    la $a0, espaco
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall
    
    li $v0, 4
    la $a0, espaco
    syscall
    
    li $v0, 1
    move $a0, $t3
    syscall
    
    li $v0, 4
    la $a0, igual
    syscall
    
    # CÁLCULO DA SOMA
    add $t4, $t0, $t1    # $t4 = ano1 + ano2
    add $t4, $t4, $t2    # $t4 = $t4 + ano3
    add $t4, $t4, $t3    # $t4 = $t4 + ano4
    
    # Imprime o resultado
    li $v0, 1
    move $a0, $t4
    syscall
    
    li $v0, 4
    la $a0, quebra
    syscall
    
    # Termina programa
    li $v0, 10
    syscall
```

### Passo 5.4: Testando o Programa 2
1. **Salve o arquivo** como `soma_anos.asm`
2. **Assemble** (F3)
3. **Execute** (F5)
4. **Resultado esperado:** `Anos de nascimento: 2000 + 2001 + 1999 + 2025 = 8025`

✅ **Checkpoint:** O programa deve somar e exibir corretamente os anos.

---

## 6. 🧪 TESTANDO OS PROGRAMAS

### Passo 6.1: Execução Passo a Passo
Para entender melhor como funciona:

1. **Assemble** o programa (F3)
2. **Vá para a aba Execute**
3. **Clique em "Step"** (F10) em vez de "Run"
4. **Observe:** Como os registradores mudam a cada instrução
5. **Continue** stepando até o final

### Passo 6.2: Verificando Registradores
Na aba "Registers", observe:
- **$t0 a $t5:** Valores dos seus números
- **$v0:** Código do syscall atual
- **$a0:** Valor sendo passado para syscall

### Passo 6.3: Modificando Valores
Para testar diferentes entradas:
1. **Mude os valores** na seção `.data`
2. **Re-assemble** e execute novamente
3. **Confirme** que os resultados mudaram correspondentemente

### Passo 6.4: Tratamento de Erros Comuns

**Erro "Label not found":**
- Verifique se todos os labels estão escritos corretamente
- Confirme que você definiu todos os labels que usa

**Erro "Runtime exception":**
- Geralmente acontece por divisão por zero ou acesso inválido à memória
- Verifique seus cálculos

**Programa não imprime nada:**
- Verifique se tem `syscall` após definir `$v0` e `$a0`
- Confirme que está usando os códigos corretos (1 para inteiro, 4 para string)

---

## 7. 🐙 CRIANDO O REPOSITÓRIO GITHUB

### Passo 7.1: Criando Conta no GitHub
1. **Acesse:** https://github.com
2. **Clique em "Sign up"**
3. **Preencha** seus dados
4. **Confirme** seu email

### Passo 7.2: Criando o Repositório
1. **Clique no "+"** no canto superior direito
2. **Selecione "New repository"**
3. **Nome:** `TDE-Assembly-MIPS` (ou similar)
4. **Descrição:** "TDE de Assembly MIPS - Programas de ordenação e soma"
5. **Marque "Public"**
6. **Marque "Add a README file"**
7. **Clique "Create repository"**

### Passo 7.3: Instalando Git (se necessário)
1. **Baixe:** https://git-scm.com/
2. **Instale** com as opções padrão
3. **Teste:** Abra cmd e digite `git --version`

### Passo 7.4: Clonando o Repositório
1. **No seu repositório GitHub**, clique no botão verde "Code"
2. **Copie** a URL (https://github.com/SEU_USUARIO/TDE-Assembly-MIPS.git)
3. **Abra o cmd** em uma pasta onde quer trabalhar
4. **Digite:** `git clone URL_QUE_VOCE_COPIOU`

### Passo 7.5: Adicionando os Arquivos
1. **Copie** seus arquivos `.asm` para a pasta do repositório
2. **Crie um arquivo README.md** (veja exemplo abaixo)
3. **No cmd, dentro da pasta**, digite:
   ```
   git add .
   git commit -m "Adiciona programas de ordenação e soma"
   git push
   ```

### Passo 7.6: Exemplo de README.md
Crie um arquivo `README.md` com este conteúdo:

```markdown
# TDE - Assembly MIPS

## Descrição
Este repositório contém os programas desenvolvidos para o TDE de Assembly MIPS.

## Programas
1. **ordenacao.asm** - Ordena a sequência 4,3,9,5,2,1
2. **soma_anos.asm** - Soma anos de nascimento dos integrantes

## Como Executar
1. Baixe o MARS MIPS Simulator
2. Abra o arquivo .asm desejado
3. Assemble (F3) e Execute (F5)

## Integrantes
- [SEU NOME]
- [NOME DO COLEGA 2]
- [NOME DO COLEGA 3]
- [NOME DO COLEGA 4]

## Vídeo Explicativo
[LINK DO YOUTUBE AQUI - adicionar depois]
```

---

## 8. 🎥 GRAVANDO O VÍDEO

### Passo 8.1: Preparação
**Antes de gravar:**
1. **Teste os programas** várias vezes
2. **Pratique a explicação** (máximo 7 minutos)
3. **Prepare um roteiro** básico
4. **Teste sua câmera e microfone**

### Passo 8.2: Estrutura Sugerida do Vídeo

**Minuto 1: Apresentação (30-60 segundos)**
- Todos se identificam com nome completo
- Dizem qual curso/turma
- Explicam brevemente o objetivo do trabalho

**Minutos 2-3: Programa de Ordenação (90 segundos)**
- Mostram o código na tela
- Explicam a lógica de comparação e troca
- Executam no MARS mostrando o resultado

**Minutos 4-5: Programa de Soma (90 segundos)**
- Mostram o código na tela
- Explicam como carregam os anos e fazem a soma
- Executam no MARS mostrando o resultado

**Minutos 6-7: Demonstração e Conclusão (60 segundos)**
- Mostram execução passo a passo (opcional)
- Falam sobre dificuldades encontradas
- Agradecem e finalizam

### Passo 8.3: Roteiro de Falas

**Para o Programa de Ordenação:**
> "Este programa ordena 6 números usando comparações diretas. Primeiro carregamos cada número em um registrador diferente ($t0 a $t5). Depois fazemos comparações sistemáticas: comparamos o primeiro número com todos os outros, depois o segundo com os restantes, e assim por diante. Quando encontramos um número maior, fazemos a troca usando um registrador auxiliar $t6."

**Para o Programa de Soma:**
> "Este programa soma os anos de nascimento dos integrantes do grupo. Carregamos cada ano em um registrador ($t0 a $t3) e depois usamos instruções ADD para somar tudo em $t4. O programa mostra os anos individuais e o resultado final da soma."

### Passo 8.4: Ferramentas para Gravação
**Gratuitas:**
- **OBS Studio** (recomendado) - https://obsproject.com/
- **Windows Game Bar** (Windows 10/11) - Win+G
- **QuickTime** (Mac)

**Configurações recomendadas:**
- **Resolução:** 1080p (1920x1080)
- **Frame rate:** 30fps
- **Formato:** MP4

### Passo 8.5: Dicas de Gravação
1. **Ambiente silencioso** - Evite ruídos de fundo
2. **Iluminação adequada** - Rosto bem iluminado
3. **Fale pausadamente** - Para clareza
4. **Mostre o código** - Zoom na tela quando necessário
5. **Teste o áudio** - Grave um teste de 30 segundos primeiro

---

## 9. 📤 ENTREGA FINAL

### Passo 9.1: Upload do Vídeo no YouTube
1. **Acesse:** https://youtube.com
2. **Clique em "Criar"** → "Enviar vídeo"
3. **Selecione seu vídeo**
4. **Título:** "TDE Assembly MIPS - [NOMES DOS INTEGRANTES]"
5. **Descrição:** Coloque os nomes completos e curso
6. **Visibilidade:** "Não listado" (para não ficar público)
7. **Publique** e **copie o link**

### Passo 9.2: Atualizando o README
1. **Edite o README.md** no GitHub
2. **Adicione o link do vídeo** na seção correspondente
3. **Commit** as alterações

### Passo 9.3: Checklist Final
Antes de entregar, verifique:

**✅ Repositório GitHub:**
- [ ] Repositório é público
- [ ] Contém `ordenacao.asm`
- [ ] Contém `soma_anos.asm`
- [ ] README.md completo com nomes dos integrantes
- [ ] Link do vídeo no README

**✅ Programas:**
- [ ] Programa 1 ordena 4,3,9,5,2,1 → 1,2,3,4,5,9
- [ ] Programa 2 soma os anos de nascimento corretos
- [ ] Ambos executam sem erro no MARS
- [ ] Código comentado e legível

**✅ Vídeo:**
- [ ] Máximo 7 minutos
- [ ] Todos os integrantes se identificam
- [ ] Explica ambos os programas
- [ ] Mostra execução no MARS
- [ ] Áudio e vídeo com boa qualidade
- [ ] Publicado no YouTube (não listado)

### Passo 9.4: Submissão
1. **Copie o link** do seu repositório GitHub
2. **Entregue conforme** as instruções do professor
3. **Guarde uma cópia** local de todos os arquivos

---

## 🎯 RESUMO RÁPIDO

**Se você tem pressa, siga esta sequência mínima:**

1. **Baixe o MARS** e execute o primeiro exemplo
2. **Copie os códigos** dos programas prontos deste guia
3. **Teste** no MARS até funcionar
4. **Crie repositório** no GitHub e faça upload
5. **Grave vídeo** de 5-7 minutos explicando
6. **Poste no YouTube** e adicione link no README
7. **Entregue o link** do repositório

---

## 🆘 HELP! PROBLEMAS COMUNS

### "O MARS não abre"
- Instale Java mais recente
- Tente executar via cmd: `java -jar Mars4_5.jar`

### "Meu código não compila"
- Verifique pontos e vírgulas
- Confirme que todos os labels existem
- Compare com os exemplos deste guia

### "Não sei usar Git/GitHub"
- Use a interface web do GitHub para criar repositório
- Faça upload manual dos arquivos via browser
- Edite o README direto no GitHub

### "Vídeo muito grande para upload"
- Comprima usando HandBrake (gratuito)
- Reduza resolução para 720p
- Corte partes desnecessárias

### "Não entendo o Assembly"
- Comece com os exemplos simples
- Execute passo a passo (F10) no MARS
- Copie os códigos prontos e estude depois

---

## 🎉 PARABÉNS!

Se você chegou até aqui e seguiu todos os passos, você:
- ✅ Aprendeu os básicos de Assembly MIPS
- ✅ Criou dois programas funcionais
- ✅ Usou o simulador MARS
- ✅ Criou repositório no GitHub
- ✅ Gravou vídeo explicativo
- ✅ Completou o TDE com sucesso!

**Boa sorte na avaliação!** 🚀

---

*Este guia foi criado para garantir que você complete o TDE com sucesso, mesmo sem conhecimento prévio de Assembly MIPS. Siga passo a passo e você conseguirá!*
