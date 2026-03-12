# 42 Piscine ExamShell Simulator

Este projeto é um motor *offline* para simular o ambiente de exames da 42 (ExamShell / Moulinette). Ele automatiza a entrega de enunciados, a compilação rigorosa (`-Wall -Wextra -Werror`) e a validação lógica e de memória, rodando localmente no seu terminal.

⚠️ **AVISO DE INTEGRIDADE ACADÊMICA** ⚠️
Para respeitar as diretrizes da 42 contra vazamento de material e facilitação de fraude, **nenhum enunciado oficial (subject) ou gabarito de teste é fornecido neste repositório**.
O que você está clonando aqui é apenas a *Engine* (o motor de testes). Cabe a você alimentar o motor com os seus próprios exercícios ou com materiais que você tenha anotado para estudo pessoal. Se tiver dúvidas sobre como criar seus próprios casos de teste, entre em contato comigo.

---

## 🛠 Pré-requisitos

Para que o motor de avaliação funcione corretamente em ambientes Linux/UNIX:
* `gcc` (GNU Compiler Collection)
* `bash` (Para os scripts orquestradores)
* Utilitários padrão do sistema: `find`, `diff`, `timeout`, `cat`

## 🚀 Instalação e Configuração

1. Clone o repositório em sua máquina.
2. Acesse a raiz do projeto pelo terminal.
3. **Ative as permissões de execução:** O sistema operacional precisa de permissão para rodar os binários. Execute uma única vez:
   ```bash
   bash setup_perms.sh
