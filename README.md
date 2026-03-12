# 42 ExamShell Simulator

Este projeto é um simulador *offline* do ambiente de exames da 42 (ExamShell). Ele automatiza a entrega de *subjects* (enunciados), compilação rigorosa com as flags da escola (`-Wall -Wextra -Werror`) e a validação de testes lógicos e de estresse de memória, tudo localmente no seu terminal.

## 🛠 Pré-requisitos

Para que o motor de correção funcione corretamente no seu sistema Linux, você precisa ter instalados:
* `gcc` (GNU Compiler Collection)
* `bash` (Para a execução dos scripts orquestradores)
* Utilitários de sistema padrão UNIX: `find`, `diff`, `timeout`, `cat`

## 🚀 Instalação e Configuração Inicial

1. **Clone ou baixe o repositório** para a sua máquina local.
2. Abra o terminal na raiz do projeto.
3. **Ajuste as permissões de execução:** O sistema operacional precisa de permissão para rodar os scripts do motor. Execute o script de setup uma única vez:
   ```bash
   bash setup_perms.sh
