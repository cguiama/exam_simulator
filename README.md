# 42 Piscine ExamShell Simulator

⚠️ **AVISO DE INTEGRIDADE ACADÊMICA** ⚠️
Para respeitar as diretrizes da 42 contra vazamento de material e facilitação de fraude, **nenhum enunciado oficial (subject) ou gabarito de teste é fornecido neste repositório**.
O que você está clonando aqui é apenas a *Engine* (o motor de testes). Cabe a você alimentar o motor com os seus próprios exercícios.

---

Este projeto é um motor *offline* para simular o ambiente de exames da 42 (ExamShell / Moulinette). Ele automatiza a entrega de enunciados, a compilação rigorosa (`-Wall -Wextra -Werror`) e a validação lógica e de memória, rodando localmente no seu terminal.

## 🛠 Pré-requisitos

Para que o motor de avaliação funcione corretamente em ambientes Linux/UNIX:
* `gcc` (GNU Compiler Collection)
* `bash` (Para os scripts orquestradores)
* Utilitários padrão do sistema: `find`, `diff`, `timeout`, `cat`

## 📂 Arquitetura de Diretórios

Para o motor funcionar, o seu ambiente local deve espelhar a estrutura abaixo. Os arquivos `.sh` são o motor (públicos), enquanto as pastas armazenam os dados (privados/locais).

```text
examshell/
├── examshell.sh      # Orquestrador da interface gráfica do terminal
├── grader.sh         # Autograder, compilador e validador de memória
├── setup_perms.sh    # Configurador de permissões de execução (inodes)
├── README.md         # Esta documentação
├── .gitignore        # Ignora as pastas de dados abaixo para evitar vazamentos
│
├── subject/          # (Você deve criar) Contém os textos dos enunciados
│   └── Level00/
│       └── aff_a/
│           └── subject.txt
│
├── tests/            # (Você deve criar) Contém os gabaritos e injetores
│   └── aff_a/
│       ├── expected.txt
│       └── run_test.sh (ou main.c)
│
├── rendu/            # (Gerada automaticamente) Sua mesa de trabalho
│   └── aff_a/
│       └── aff_a.c
│
└── traces/           # (Gerada automaticamente) Logs gerados em caso de falha lógica
    └── aff_a.trace
```

## 🚀 Instalação e Configuração

1. Clone o repositório em sua máquina.
2. Acesse a raiz do projeto pelo terminal.
3. Crie as pastas de dados que o `.gitignore` oculta (`mkdir subject tests`).
4. **Ative as permissões de execução:** O sistema operacional precisa de permissão para rodar os binários. Execute uma única vez:
   ```bash
   bash setup_perms.sh
   ```

## 💻 Como Usar o Simulador

1. **Inicie o motor:**
   ```bash
   ./examshell.sh
   ```
2. O script limpará a tela, sorteará um desafio do nível atual e travará o terminal exibindo o enunciado.
3. Abra uma **nova aba** no terminal. Navegue até o diretório indicado (ex: `./rendu/nome_do_exercicio/`), crie o seu arquivo `.c` e resolva o problema.
4. Na aba do simulador, digite `grademe` para disparar a compilação e os testes.
5. Se passar, o simulador avançará. Se falhar, você poderá tentar novamente.

---

## ⚙️ Como Adicionar Seus Próprios Exercícios

Para que o orquestrador e o autograder reconheçam novos desafios, você precisa alimentar as pastas `subject/` e `tests/`.

### 1. A Pasta do Enunciado (`subject/`)
Crie a estrutura: `subject/LevelXX/nome_do_exercicio/subject.txt`. O conteúdo de `subject.txt` será impresso na tela do simulador.

### 2. A Pasta de Testes e Gabaritos (`tests/`)
Crie a estrutura: `tests/nome_do_exercicio/`. Dentro dela, você **precisa** de dois arquivos:

1. **`expected.txt`**: O arquivo contendo a saída exata (o gabarito) que o programa deve imprimir no terminal.
2. **A Estratégia de Avaliação**: O motor suporta dois tipos de exercícios:
   * **Estratégia A (Programa Completo):** Se o exercício pede um `int main`, crie um arquivo chamado **`run_test.sh`**. Este script será acionado pelo motor para executar o seu binário gerado (Ex: `./$1` ou `./$1 "teste"`).
   * **Estratégia B (Apenas Função):** Se o exercício pede apenas uma função (ex: `void ft_putchar(char c)`), crie um arquivo **`main.c`** chamando a função do aluno. O motor fará a linkagem estática automaticamente.

## 🔍 Depuração e Traces

Se o seu código compilar perfeitamente, mas a lógica falhar, o motor gerará um arquivo na pasta `./traces/nome_do_exercicio.trace` usando o formato *Unified Diff*.
Ele mapeia a memória e exibe no terminal: o sinal `-` indica o gabarito esperado, e o `+` indica a divergência que o seu código imprimiu.
