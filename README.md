# Genetic Algorithm in ARM64 Assembly

Este projeto implementa um algoritmo genético em assembly ARM64 para otimização de uma função fitness. O código é destinado a sistemas macOS.

## 📋 Descrição

O algoritmo genético opera sobre uma população de indivíduos, onde cada indivíduo é representado por um conjunto de 4 genes (valores inteiros). O objetivo é maximizar a função fitness, que calcula a soma dos genes de um indivíduo, com um valor máximo limitado a 50.

## 🧠 Estrutura do Código

### Funções Implementadas

#### 1. `fitness`
Calcula o valor de adaptação (fitness) de um indivíduo.
- **Entrada:** 
  - `x0`: Endereço do indivíduo (array de 4 inteiros)
- **Saída:**
  - `w0`: Valor de fitness (soma dos genes, limitada a 50)

#### 2. `generate_individual`
Gera um indivíduo aleatório com genes entre 0 e 49.
- **Saída:**
  - `x0, x1`: Indivíduo gerado (dois registradores de 64 bits contendo 4 inteiros)

#### 3. `mutate`
Aplica mutação a um indivíduo com probabilidade fixa.
- **Entrada:**
  - `x0, x1`: Indivíduo a ser mutado
- **Saída:**
  - `x0, x1`: Indivíduo após mutação

#### 4. `crossover`
Realiza crossover entre dois pais para produzir dois filhos.
- **Entrada:**
  - `x0, x1`: Primeiro pai
  - `x2, x3`: Segundo pai
  - `x4`: Endereço para o primeiro filho
  - `x5`: Endereço para o segundo filho

#### 5. `main`
Função principal que orquestra o algoritmo genético:
1. Inicializa população aleatória
2. Executa 50.000 gerações
3. Avalia fitness
4. Seleciona melhores indivíduos
5. Aplica crossover e mutação
6. Exibe resultados

## 🚀 Como Executar

### Pré-requisitos
- Sistema macOS
- Toolchain de assembly ARM64

### Compilação e Execução
```bash
# Compilar o código
as -o genetic_algorithm.o genetic_algorithm.s
ld -o genetic_algorithm genetic_algorithm.o -lSystem

# Executar o programa
./genetic_algorithm
```

## 📊 Saída do Programa

O programa exibe informações durante a execução:
- Melhor fitness e indivíduo a cada geração
- Resultado final com o melhor indivíduo encontrado

Exemplo de saída:
```
Generation X: Best fitness = Y, Best individual = {g1, g2, g3, g4}
Final Best Fitness = Z, Best Individual = {g1, g2, g3, g4}
```

## ⚙️ Parâmetros do Algoritmo

- Tamanho da população: 50 indivíduos
- Genes por indivíduo: 4 valores
- Valor máximo de fitness: 50
- Número de gerações: 50.000
- Probabilidade de mutação: fixa (definida internamente)

## 🔍 Detalhes de Implementação

- Utiliza instruções ARM64 otimizadas
- Operações de fitness e mutação vetorizadas
- Alocação estática de memória para população
- Geração de números aleatórios via `rand()`

## 📝 Notas

Este código é uma implementação educacional de algoritmo genético em assembly de baixo nível. Para uso em problemas reais, recomenda-se:
1. Adaptar a função fitness para o problema específico
2. Ajustar os parâmetros do algoritmo
3. Implementar em linguagem de alto nível para melhor maintainabilidade

## 📄 Licença

Este projeto está disponível para fins educacionais.
