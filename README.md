# TP_5-Sem - Sistema de Gerenciamento de Candidatos para uma Agência de Empregos

## 1. Introdução

Este trabalho apresenta o desenvolvimento de um sistema de gerenciamento de candidatos para uma agência de empregos, utilizando um script em Shell (Bash) no ambiente Linux. O sistema foi projetado para automatizar e simplificar o gerenciamento de informações dos candidatos, com o objetivo de melhorar a eficiência operacional da agência e garantir uma manipulação eficaz dos dados.

Em um contexto em que a gestão de grandes volumes de dados pode ser desafiadora, especialmente em uma agência de empregos que lida com múltiplos candidatos diariamente, a necessidade de uma solução prática e automatizada é evidente. O sistema desenvolvido visa atender a essa necessidade ao oferecer uma ferramenta robusta para o cadastro, listagem, pesquisa, exclusão e exportação de dados dos candidatos.

O script em Shell proporciona uma interface intuitiva e eficiente, permitindo que os usuários realizem operações essenciais com facilidade. Através de comandos simples e diretos, o sistema permite a inserção de novas informações, a visualização e organização dos candidatos cadastrados, a busca rápida por registros específicos e a remoção de dados obsoletos. Além disso, a funcionalidade de exportação para CSV facilita a integração dos dados com outras ferramentas e a geração de relatórios detalhados.

## 2. Como Utilizar o Script

### Requisitos Necessários

- Um sistema operacional Linux.
- Acesso ao terminal de comando.
- Permissões para criar e editar arquivos no sistema.

### Preparação do Script

1. **Criação do Arquivo Script:**

   Abra o terminal e use o comando `nano` para criar um arquivo chamado `cadastro_profissoes.sh`:

   ```bash
   nano cadastro_profissoes.sh
   
2. **Inserção do Código:**

   Copie o código do script e cole no editor de texto.

   Salve o arquivo pressionando `Ctrl + O` e saia do editor com `Ctrl + X`.

3. **Tornar o Script Executável:**

   No terminal, execute o comando:

   ```bash
   chmod +x cadastro_profissoes.sh

### Execução do Script

Para iniciar o script, use o comando:

```bash
./cadastro_profissoes.sh

```
### Navegar pelo Menu

O script apresenta um menu com várias opções:

1. **Cadastrar novo candidato**: Permite adicionar um novo candidato ao sistema.
2. **Listar todos os candidatos**: Exibe uma lista de todos os candidatos cadastrados.
3. **Pesquisar candidato**: Realiza uma busca por candidatos específicos pelo nome.
4. **Remover candidato**: Exclui um candidato do cadastro pelo nome.
5. **Exportar dados para CSV**: Exporta os dados cadastrados para um arquivo CSV.
6. **Limpar tela**: Limpa o terminal para facilitar a visualização.
7. **Sair**: Encerra a execução do script.

