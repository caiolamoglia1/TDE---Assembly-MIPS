# 🎬 ROTEIRO COMPLETO PARA VÍDEO - TDE Assembly MIPS

## ⏱️ DURAÇÃO TOTAL: 6-7 MINUTOS

---

## 🎯 ESTRUTURA DO VÍDEO

### **MINUTO 1: ABERTURA E APRESENTAÇÕES (0:00 - 1:00)**

#### **[0:00 - 0:15] Abertura**
**🎤 FALA SUGERIDA:**
> "Olá! Somos o grupo [X] da turma [Y] do curso de [CURSO]. Hoje vamos apresentar nosso TDE de Assembly MIPS, onde desenvolvemos dois programas usando o simulador MARS."

**📹 O QUE MOSTRAR:**
- Todos os integrantes na tela
- Pode ser uma câmera ou cada um se apresentando

#### **[0:15 - 1:00] Apresentação Individual**
**🎤 CADA INTEGRANTE FALA (10-15 segundos cada):**
> "Eu sou [NOME COMPLETO], [RA/MATRÍCULA]"

**📋 CHECKLIST:**
- [ ] Todos se identificaram com nome completo
- [ ] Mencionaram curso e turma
- [ ] Explicaram brevemente o objetivo

---

### **MINUTO 2-3: PROGRAMA 1 - ORDENAÇÃO (1:00 - 3:00)**

#### **[1:00 - 1:30] Explicação do Problema**
**🎤 FALA SUGERIDA:**
> "O primeiro programa ordena a sequência 4, 3, 9, 5, 2, 1 em ordem crescente. O resultado esperado é 1, 2, 3, 4, 5, 9. Vamos mostrar nosso código."

**📹 O QUE MOSTRAR:**
- Abrir o arquivo `ordenacao.asm` no MARS
- Zoom na seção `.data` mostrando os números

#### **[1:30 - 2:30] Explicação do Código**
**🎤 FALA SUGERIDA:**
> "Nossa estratégia é simples: carregamos cada número em um registrador diferente - $t0 até $t5. Depois fazemos comparações sistemáticas entre todos os pares. Quando encontramos um número maior, fazemos a troca usando um registrador auxiliar $t6. Por exemplo, aqui comparamos $t0 com $t1 usando a instrução 'ble' - branch if less or equal. Se $t0 for maior que $t1, fazemos a troca."

**📹 O QUE MOSTRAR:**
- Scroll pelo código mostrando:
  - Seção `.data` com os números
  - Carregamento dos números nos registradores
  - Exemplo de uma comparação e troca
  - Seção de impressão do resultado

#### **[2:30 - 3:00] Execução no MARS**
**🎤 FALA SUGERIDA:**
> "Agora vamos executar o programa. Primeiro fazemos o Assemble, depois Run, e aqui está nosso resultado: a sequência ordenada 1, 2, 3, 4, 5, 9."

**📹 O QUE MOSTRAR:**
- Clicar em "Assemble" (F3)
- Ir para aba "Execute"
- Clicar em "Run" (F5)
- Mostrar o resultado na console

---

### **MINUTO 4-5: PROGRAMA 2 - SOMA DOS ANOS (3:00 - 5:00)**

#### **[3:00 - 3:30] Explicação do Problema**
**🎤 FALA SUGERIDA:**
> "O segundo programa soma os anos de nascimento dos integrantes do nosso grupo. Temos os anos [MENCIONAR OS ANOS REAIS], e o programa calcula a soma total."

**📹 O QUE MOSTRAR:**
- Abrir o arquivo `soma_anos.asm` no MARS
- Zoom na seção `.data` mostrando os anos

#### **[3:30 - 4:30] Explicação do Código**
**🎤 FALA SUGERIDA:**
> "Aqui carregamos cada ano em um registrador separado - $t0 até $t3. Depois usamos instruções ADD para somar tudo em $t4. Primeiro $t4 recebe $t0 + $t1, depois adicionamos $t2, e por fim $t3. O programa também mostra os anos individuais antes de exibir o resultado final."

**📹 O QUE MOSTRAR:**
- Seção `.data` com os anos
- Carregamento nos registradores
- Seção de cálculo da soma
- Seção de impressão que mostra "ano1 + ano2 + ano3 + ano4 = resultado"

#### **[4:30 - 5:00] Execução no MARS**
**🎤 FALA SUGERIDA:**
> "Executando o programa, vemos que ele mostra nossos anos de nascimento e calcula corretamente a soma total de [RESULTADO]."

**📹 O QUE MOSTRAR:**
- Assemble e Execute
- Resultado na console mostrando a soma

---

### **MINUTO 6-7: DEMONSTRAÇÃO TÉCNICA E CONCLUSÃO (5:00 - 7:00)**

#### **[5:00 - 6:00] Demonstração Passo a Passo (OPCIONAL)**
**🎤 FALA SUGERIDA:**
> "Para mostrar como o Assembly funciona internamente, vamos executar o programa de ordenação passo a passo e observar como os registradores mudam."

**📹 O QUE MOSTRAR:**
- Voltar para programa de ordenação
- Assemble
- Usar "Step" (F10) algumas vezes
- Mostrar mudanças na aba "Registers"
- Focar em como $t0, $t1, etc. mudam de valor

#### **[6:00 - 6:45] Dificuldades e Aprendizados**
**🎤 FALA SUGERIDA:**
> "Durante o desenvolvimento, nossa maior dificuldade foi entender a lógica das instruções de branch e como fazer as trocas corretamente. Aprendemos muito sobre como o processador trabalha com registradores e memória."

**📹 O QUE MOSTRAR:**
- Pode voltar para os códigos
- Ou manter os integrantes na tela

#### **[6:45 - 7:00] Encerramento**
**🎤 FALA SUGERIDA:**
> "Nossos programas funcionam corretamente conforme solicitado no TDE. O código está disponível no GitHub no repositório [MENCIONAR NOME]. Obrigado pela atenção!"

**📹 O QUE MOSTRAR:**
- Todos os integrantes
- Pode mostrar rapidamente o repositório GitHub

---

## 📝 SCRIPT DETALHADO POR INTEGRANTE

### **INTEGRANTE 1 (Líder/Apresentador Principal)**
**Responsabilidades:**
- Abertura do vídeo
- Explicação do Programa 1 (Ordenação)
- Coordenação geral

**Falas específicas:**
- Abertura e apresentação do grupo
- Explicação completa do algoritmo de ordenação
- Demonstração da execução do primeiro programa

### **INTEGRANTE 2**
**Responsabilidades:**
- Explicação do Programa 2 (Soma)
- Demonstração técnica

**Falas específicas:**
- Explicação do problema da soma dos anos
- Como o código da soma funciona
- Execução do segundo programa

### **INTEGRANTE 3**
**Responsabilidades:**
- Demonstração passo a passo
- Aspectos técnicos

**Falas específicas:**
- Explicação sobre registradores e memória
- Demonstração step-by-step no MARS
- Dificuldades técnicas encontradas

### **INTEGRANTE 4**
**Responsabilidades:**
- Conclusão
- GitHub e entrega

**Falas específicas:**
- Resumo dos resultados obtidos
- Menção ao repositório GitHub
- Agradecimentos e encerramento

---

## 🎬 ROTEIRO DE FILMAGEM

### **ANTES DE GRAVAR:**

#### **Preparação Técnica:**
- [ ] Testar câmera e microfone
- [ ] MARS instalado e funcionando
- [ ] Programas testados e funcionando
- [ ] Repositório GitHub pronto
- [ ] Ensaiar pelo menos 2 vezes

#### **Configuração da Gravação:**
- [ ] Resolução: 1080p (1920x1080)
- [ ] Frame rate: 30fps
- [ ] Ambiente silencioso
- [ ] Boa iluminação
- [ ] Zoom adequado para mostrar código

#### **Arquivos Preparados:**
- [ ] `ordenacao.asm` aberto no MARS
- [ ] `soma_anos.asm` aberto no MARS
- [ ] Anos de nascimento reais configurados
- [ ] GitHub aberto em aba separada

### **DURANTE A GRAVAÇÃO:**

#### **Transições Suaves:**
- "Agora vamos para o segundo programa..."
- "Vamos executar isso no simulador..."
- "Para concluir nossa apresentação..."

#### **Pausas Estratégicas:**
- Após cada explicação de código (2-3 segundos)
- Antes de clicar em botões (1 segundo)
- Entre as falas dos integrantes (1 segundo)

#### **Ênfases Importantes:**
- **Resultado esperado** vs **resultado obtido**
- **Números antes** e **depois da ordenação**
- **Anos individuais** e **soma total**

---

## 🚨 CHECKLIST DE QUALIDADE

### **CONTEÚDO:**
- [ ] Todos os integrantes se identificaram completamente
- [ ] Explicou o problema de ordenação claramente
- [ ] Mostrou o código de ordenação funcionando
- [ ] Explicou o problema da soma claramente
- [ ] Mostrou o código da soma funcionando
- [ ] Demonstrou execução no MARS
- [ ] Mencionou dificuldades/aprendizados
- [ ] Citou o repositório GitHub

### **TÉCNICO:**
- [ ] Áudio claro e sem ruídos
- [ ] Vídeo com boa qualidade
- [ ] Código legível na tela
- [ ] Transições suaves
- [ ] Duração entre 5-7 minutos
- [ ] Todos visíveis quando falam

### **DIDÁTICO:**
- [ ] Explicações claras e objetivas
- [ ] Mostrou resultados corretos
- [ ] Linguagem adequada
- [ ] Ritmo apropriado (nem muito rápido, nem muito lento)
- [ ] Foco nos pontos principais

---

## 🎤 FRASES PRONTAS PARA USAR

### **Para Transições:**
- "Agora vamos mostrar nosso segundo programa..."
- "Vamos executar isso no simulador MARS..."
- "Como podemos ver aqui no código..."
- "O resultado obtido foi exatamente o esperado..."

### **Para Explicações Técnicas:**
- "Utilizamos o registrador $t0 para..."
- "A instrução 'ble' significa branch if less or equal..."
- "Fazemos a troca usando um registrador auxiliar..."
- "A soma é calculada através de instruções ADD sequenciais..."

### **Para Demonstrações:**
- "Primeiro fazemos o Assemble pressionando F3..."
- "Agora vamos para a aba Execute..."
- "Clicando em Run, obtemos nosso resultado..."
- "Como podemos ver na console de saída..."

### **Para Problemas/Dificuldades:**
- "Nossa principal dificuldade foi..."
- "Aprendemos que é importante..."
- "Durante o desenvolvimento, descobrimos que..."
- "O simulador MARS nos ajudou a..."

---

## ⏰ CRONÔMETRO DE CONTROLE

Use este cronômetro durante a gravação:

- **[0:00 - 1:00]** ✅ Apresentações
- **[1:00 - 3:00]** ✅ Programa 1 
- **[3:00 - 5:00]** ✅ Programa 2
- **[5:00 - 7:00]** ✅ Demo técnica + Conclusão

**⚠️ Se estiver passando do tempo:**
- Acelere nas explicações de código
- Pule a demonstração passo a passo
- Vá direto para a conclusão

**⚠️ Se estiver sobrando tempo:**
- Adicione mais detalhes técnicos
- Mostre execução passo a passo
- Explique mais sobre as dificuldades

---

## 🎯 DICAS FINAIS PARA O SUCESSO

### **1. Ensaiem Antes!**
- Gravem um teste de 2 minutos primeiro
- Cronometrem cada parte
- Ajustem o ritmo conforme necessário

### **2. Foquem no Essencial:**
- **Identificação** ✅
- **Programa 1 funcionando** ✅
- **Programa 2 funcionando** ✅
- **Código explicado** ✅

### **3. Qualidade > Perfeição:**
- Se errarem uma palavra, continuem
- Melhor um vídeo natural que artificial
- O importante é mostrar que entenderam o conteúdo

### **4. Backup Plan:**
- Se algo der errado, gravem por partes
- Podem editar depois no editor de vídeo
- Tenham os programas já testados como backup

---

**🚀 BOA SORTE NA GRAVAÇÃO!**

*Seguindo este roteiro, vocês terão um vídeo profissional e completo que atende todos os requisitos do TDE.*
