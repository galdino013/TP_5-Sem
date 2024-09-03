#!/bin/bash

# Define um array associativo para as profissões
declare -A profissoes
profissoes=(
    [1]="Cartógrafo"
    [2]="Assistente Social"
    [3]="Psicólogo"
    [4]="Atendente"
    [5]="Secretária Bilíngue"
    [6]="Geólogo"
)

# Função para exibir as profissões
mostrar_profissoes() {
    echo "Profissões disponíveis:"
    for codigo in "${!profissoes[@]}"; do
        echo "Código $codigo - ${profissoes[$codigo]}"
    done
}

# Função para mostrar o menu principal
mostrar_menu() {
    echo "======================================="
    echo "=SEJA BEM VINDO AO CADASTRO DE USUÁRIO="
    echo "======================================="
    echo "1. Cadastrar novo candidato"
    echo "2. Listar todos os candidatos"
    echo "3. Pesquisar candidato"
    echo "4. Remover candidato"
    echo "5. Exportar dados para CSV"
    echo "6. Limpar tela"
    echo "7. Sair"
    echo "8. Créditos"
    echo "======================================="
}

# Função para validar entrada do usuário
validar_entrada() {
    # Valida o nome do candidato
    while true; do
        read -p "Digite o nome do candidato: " nome
        if [[ -n "$nome" ]]; then
            break
        else
            echo -e "\033[1;31mNome não pode ser vazio. Por favor, insira um nome.\033[0m"
        fi
    done

    # Valida o sexo do candidato
    while true; do
        read -p "Digite o sexo do candidato (M/F): " sexo
        if [[ $sexo =~ ^[MmFf]$ ]]; then
            sexo=${sexo^^}  # Converte para maiúscula
            break
        else
            echo -e "\033[1;31mSexo inválido. Por favor, insira M ou F.\033[0m"
        fi
    done

    # Valida a pretensão salarial do candidato
    while true; do
        read -p "Digite a pretensão salarial do candidato (em R$): " salario
        if [[ $salario =~ ^[1-9][0-9]*(\.[0-9]{1,2})?$ ]]; then
            break
        else
            echo -e "\033[1;31mPretensão salarial inválida. Por favor, insira um valor maior que zero.\033[0m"
        fi
    done

    # Valida a idade do candidato
    while true; do
        read -p "Digite a idade do candidato: " idade
        if [[ $idade =~ ^[1-9][0-9]*$ ]]; then
            break
        else
            echo -e "\033[1;31mIdade inválida. Por favor, insira um número inteiro maior que zero.\033[0m"
        fi
    done

    mostrar_profissoes

    while true; do
        read -p "Digite o código da profissão: " codigo_profissao
        if [[ $codigo_profissao =~ ^[1-6]$ ]]; then
            profissao="${profissoes[$codigo_profissao]}"
            break
        else
            echo -e "\033[1;31mCódigo de profissão inválido. Por favor, insira um número entre 1 e 6.\033[0m"
        fi
    done

    data_cadastro=$(date '+%d/%m/%Y')
}

# Função para salvar o candidato no arquivo
salvar_candidato() {
    echo "$nome;$sexo;$salario;$idade;$profissao;$data_cadastro" >> cadastros.txt
    echo -e "\033[1;32mCandidato cadastrado com sucesso!\033[0m"
    echo "======================================="
    sleep 3
    clear
}

# Função para listar todos os candidatos
listar_candidatos() {
    if [ -f cadastros.txt ]; then
        echo "Lista de candidatos cadastrados:"
        echo "Nome;Sexo;Salário;Idade;Profissão;Data de Cadastro"
        cat cadastros.txt
    else
        echo -e "\033[1;31mNenhum candidato cadastrado ainda.\033[0m"
    fi
}

# Função para pesquisar um candidato pelo nome
pesquisar_candidato() {
    read -p "Digite o nome do candidato para pesquisa: " nome_pesquisa
    if grep -i "$nome_pesquisa" cadastros.txt; then
        echo "Candidato(s) encontrado(s)!"
    else
        echo -e "\033[1;31mNenhum candidato encontrado com o nome '$nome_pesquisa'.\033[0m"
    fi
}

# Função para remover um candidato pelo nome completo
remover_candidato() {
    read -p "Digite o nome completo do candidato para remover: " nome_remover
    if grep -iq "^$nome_remover;" cadastros.txt; then
        grep -iv "^$nome_remover;" cadastros.txt > temp.txt && mv temp.txt cadastros.txt
        echo -e "\033[1;32mCandidato '$nome_remover' removido com sucesso!\033[0m"
    else
        echo -e "\033[1;31mNenhum candidato encontrado com o nome '$nome_remover'.\033[0m"
    fi
}

# Função para exportar dados para um arquivo CSV
exportar_para_csv() {
    if [ -f cadastros.txt ]; then
        cp cadastros.txt cadastros.csv
        echo -e "\033[1;32mDados exportados para 'cadastros.csv' com sucesso!\033[0m"
    else
        echo -e "\033[1;31mNenhum dado para exportar.\033[0m"
    fi
}

# Função para limpar a tela
limpar_tela() {
    clear
}

# Função que mostra os créditos - Pessoas do grupo
creditos() {
    echo "Igor Galdino dos Santos - RA: N009GC-5"
    sleep 1
    echo "Leonardo Marana - RA: N0087G-5"
    sleep 0.5
    echo "Pedro Henrique de Souza Putinatti - RA: N0239C-5"
    sleep 0.5
    echo "Amyr Abdul Rahman - RA: G45BJB-5"
    sleep 0.5
    echo "Yudi T C Affonso - RA: N81436-5"
    sleep 0.5
    echo "João Victor Melo Carvalho - RA: N88027-9"
    sleep 0.5
    echo "Felipe da Silva Oier - RA: G0779F-8"
    sleep 0.5
    echo "Henrique José da Silva - RA: N031GE-7"
    sleep 0.5
    echo "Victor Hugo Alves Gimenez - RA: N8540E-6"
    sleep 0.5
    echo "Gabriel Peixoto Matanó - RA: N8633E-7"
    sleep 0.5
    echo "Lukas Andrade Nascimento - RA: G4143D-4"
    sleep 0.5
    echo " "
    echo "Pressione ENTER para retornar ao menu inicial"
    read
    clear
}

# Função para confirmar a saída do script
confirmar_saida() {
    read -p "Tem certeza de que deseja sair? (S/N): " confirmar
    case $confirmar in
        [Ss]*) 
            echo "Saindo..."
            exit 0
            ;;
        [Nn]*) 
            echo "Retornando ao menu..."
            ;;
        *)
            echo -e "\033[1;31mOpção inválida. Tente novamente.\033[0m"
            confirmar_saida
            ;;
    esac
}

# Loop principal do script
while true; do
    mostrar_menu
    read -p "Escolha uma opção: " opcao

    case $opcao in
        1)
            validar_entrada
            salvar_candidato
            ;;
        2)
            listar_candidatos
            ;;
        3)
            pesquisar_candidato
            ;;
        4)
            remover_candidato
            ;;
        5)
            exportar_para_csv
            ;;
        6)
            limpar_tela
            ;;
        7)
            confirmar_saida
            ;;
        8)
            creditos
            ;;
        *)
            echo -e "\033[1;31mOpção inválida. Tente novamente.\033[0m"
            ;;
    esac
done
