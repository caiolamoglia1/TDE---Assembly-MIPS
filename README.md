# TDE - Assembly MIPS - Simulador MARS

Este repositório contém os dois programas em Assembly MIPS desenvolvidos para a atividade de Trabalho Discente Efetivo (TDE).

## 📋 Descrição da Atividade

**Objetivo**: Manipular assembly por meio do simulador MARS MIPS.

### Programas Desenvolvidos:

1. **Ordenação de Sequência** (`ordenacao.asm`)
   - Ordena a sequência 4,3,9,5,2,1 em forma crescente
   - Utiliza algoritmo Bubble Sort
   - Saída esperada: 1,2,3,4,5,9

2. **Soma de Anos de Nascimento** (`soma_anos.asm`)
   - Realiza a soma dos anos de nascimento dos acadêmicos do grupo
   - Para trabalho individual: soma com 2025

## 🚀 Como Executar

1. Baixe e instale o [MARS MIPS Simulator](http://courses.missouristate.edu/KenVollmar/mars/)
2. Abra o simulador MARS
3. Carregue o arquivo `.asm` desejado
4. Clique em "Assemble" (F3)
5. Execute o programa clicando em "Run" (F5)

## 📁 Estrutura dos Arquivos

```
/
├── ordenacao.asm      # Programa de ordenação da sequência
├── soma_anos.asm      # Programa de soma dos anos de nascimento
└── README.md          # Este arquivo
```

## 🔧 Detalhes Técnicos

### Programa 1 - Ordenação (ordenacao.asm)
- **Algoritmo**: Bubble Sort
- **Entrada**: Array com valores [4, 3, 9, 5, 2, 1]
- **Saída**: Sequência ordenada: 1 2 3 4 5 9
- **Registradores utilizados**: $t0-$t6, $s0-$s2

### Programa 2 - Soma Anos (soma_anos.asm)
- **Entrada**: Array com anos de nascimento
- **Processamento**: Soma iterativa dos valores
- **Saída**: Resultado da soma
- **Registradores utilizados**: $t0-$t4, $s0-$s1

## 📹 Vídeo Explicativo

🎥 **Link do vídeo no YouTube**: [INSERIR LINK DO VÍDEO AQUI]

*O vídeo contém a explicação detalhada do código com a identificação de todos os integrantes do grupo.*

## 👥 Integrantes do Grupo

- [Nome do Integrante 1]
- [Nome do Integrante 2]
- [Nome do Integrante 3]
- [Nome do Integrante 4]

## 📝 Observações

- Código desenvolvido exclusivamente pelos integrantes do grupo
- Não foi utilizada IA para geração do código
- Todos os comentários foram feitos manualmente
- Testado no simulador MARS MIPS

## 🔗 Recursos Utilizados

- [MARS MIPS Simulator](http://courses.missouristate.edu/KenVollmar/mars/)
- [Tutorial MIPS Using MARS](Tutorial_MIPS_Using_MARS.pdf)
- [Exemplo Fibonacci](dpetersanderson.github.io/Fibonacci.asm)

---

*Este trabalho foi desenvolvido como parte da disciplina de Arquitetura de Computadores.*
