# 🐾 Examullator: Piscine C Training (Pets & Veggies Edition)

Este é um simulador local do examshell da 42, recriado do zero com uma arquitetura autoral e uma temática focada em animais e vegetais. O objetivo é treinar a lógica de baixo nível, manipulação de memória e ponteiros em C, sem infringir a propriedade intelectual dos enunciados originais.

## 🚀 Como começar

Para usar este simulador e salvar o seu progresso no seu próprio perfil do GitHub, siga o fluxo abaixo:

### 1. Star e Fork 🌟
Antes de baixar, clique na **Estrela (Star)** no canto superior direito para apoiar o projeto.
Em seguida, clique em **Fork**.
> **Por que fazer um Fork?** O Fork cria uma cópia exata deste repositório na sua conta. Isso permite que você resolva os exercícios na pasta `ryu/`, faça `git commit` e salve o seu código no seu próprio GitHub, mantendo um portfólio do seu aprendizado.

### 2. Clone o seu repositório 💻
Abra o seu terminal e clone a **sua** versão do repositório (substitua `SEU_USUARIO` pelo seu login do GitHub):

```bash
git clone [https://github.com/SEU_USUARIO/NOME_DO_REPOSITORIO.git](https://github.com/SEU_USUARIO/NOME_DO_REPOSITORIO.git)
cd NOME_DO_REPOSITORIO
```

### 3. Permissões de Execução no Linux 🐧
Os scripts de orquestração (`examullator.sh` e `grader.sh`) precisam de permissão do sistema operacional para serem executados como programas, e não apenas lidos como texto. Conceda essa permissão com o comando:

```bash
./setup_perms.sh
```

### 4. Execute o Examullator 🎯
Agora, basta iniciar o simulador. Ele sorteará os exercícios automaticamente respeitando as regras de progressão de dificuldade.

```bash
./examullator.sh
```

---

## 🛠️ Como funciona a avaliação? (Atenção ao Mock Git)

Para simular a pressão e a memória muscular da prova real, o avaliador exige o fluxo completo de versionamento (Mock Vogsphere) antes de corrigir seu código:

1. O simulador pedirá que você crie a sua solução em C dentro da pasta `ryu/nome_do_exercicio/`.
2. Após escrever e salvar seu código no editor, volte ao terminal do `examullator.sh` e adicione os arquivos na staging area:
   ```text
   git add .
   ```
3. Salve o estado do seu código com um commit:
   ```text
   git commit -m "feat: done"
   ```
4. Envie para o servidor simulado:
   ```text
   git push
   ```
5. Somente após o push concluído, digite **`grademe`** para iniciar a avaliação.
6. O `grader.sh` entrará em ação, compilará seu código com as flags estritas (`-Wall -Wextra -Werror`) e comparará a saída exata da sua lógica com a saída esperada usando `diff`.
7. Se houver diferenças na saída, falha de memória (Segfault) ou loop infinito (Timeout), o avaliador cortará a execução. Um log detalhado será gerado na pasta `trechos/` para você debugar, e **o mock git será resetado** (você terá que fazer add/commit/push novamente após corrigir o código).
8. Para encerrar o simulador a qualquer momento, digite **`finish`**.

---

## 🤝 Encontrou um bug ou quer contribuir?

Se você tem **certeza absoluta** de que a lógica da sua memória e a manipulação dos seus ponteiros estão corretas, mas o avaliador insiste em reprovar, pode haver um edge case não mapeado ou um bug nos arquivos de teste (como um `\n` invisível faltando no `expected.txt`).

* **Abrir uma Issue:** Vá na aba "Issues" deste repositório original e descreva o problema. Mostre a saída do seu terminal e o log de erro gerado na pasta `trechos/`.
* **Pull Requests (PR):** Conseguiu consertar um teste quebrado ou quer adicionar um exercício novo com a nossa temática de Pets/Veggies? Faça o commit na sua branch, abra um Pull Request e vamos evoluir a arquitetura do simulador juntos!
