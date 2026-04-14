#!/bin/bash

# Cores para facilitar a leitura
VERDE='\033[0;32m'
AZUL='\033[0;34m'
SEM_COR='\033[0m'

echo -e "${AZUL}--- Iniciando Manutenção do Sistema ---${SEM_COR}"

# 1. Atualizar a lista de repositórios
echo -e "\n${VERDE}[1/4] Atualizando lista de pacotes...${SEM_COR}"
sudo apt update

# 2. Aplicar as atualizações de software
echo -e "\n${VERDE}[2/4] Instalando atualizações disponíveis...${SEM_COR}"
sudo apt upgrade -y

# 3. Remover pacotes que não são mais necessários (limpeza de dependências)
echo -e "\n${VERDE}[3/4] Removendo pacotes inúteis (autoremove)...${SEM_COR}"
sudo apt autoremove -y

# 4. Limpar o cache de pacotes antigos
echo -e "\n${VERDE}[4/4] Limpando o cache do apt...${SEM_COR}"
sudo apt autoclean

echo -e "\n${AZUL}--- Sistema Atualizado com Sucesso! ---${SEM_COR}"