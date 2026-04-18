#!/bin/bash

# =================================================================
# Script de Atualização Automatizada - RHEL 10
# Mantenedor: Dimas O Primeiro
# =================================================================

# Cores para facilitar a leitura
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # Sem cor

echo -e "${YELLOW}Iniciando processo de manutenção do sistema...${NC}"

# 1. Verificar se o usuário é root
if [ "$EUID" -ne 0 ]; then 
  echo -e "${RED}Erro: Por favor, execute como root ou use sudo.${NC}"
  exit 1
fi

# 2. Verificar status da subscrição
echo -e "${YELLOW}[1/4] Verificando registro na Red Hat...${NC}"
subscription-manager status > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo -e "${RED}Aviso: Sistema não registrado ou assinatura expirada.${NC}"
    echo "Deseja registrar agora? (s/n)"
    read -r response
    if [[ "$response" =~ ^([sS][imIM]|[sS])$ ]]; then
        subscription-manager register --auto-attach
    else
        echo -e "${RED}Abortando. É necessário registro para acessar os repositórios.${NC}"
        exit 1
    fi
fi

# 3. Limpeza de cache e metadados
echo -e "${YELLOW}[2/4] Limpando cache do DNF...${NC}"
dnf clean all

# 4. Executar o Upgrade
echo -e "${YELLOW}[3/4] Iniciando atualização de pacotes...${NC}"
dnf upgrade -y

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Sistema atualizado com sucesso!${NC}"
else
    echo -e "${RED}Erro durante a atualização. Verifique os logs.${NC}"
    exit 1
fi

# 5. Verificar necessidade de reinicialização
echo -e "${YELLOW}[4/4] Verificando se o Kernel foi atualizado...${NC}"
LAST_KERNEL=$(rpm -q --last kernel | perl -pe 's/^kernel-(\S+).*/$1/' | head -1)
CURRENT_KERNEL=$(uname -r)

if [ "$LAST_KERNEL" != "$CURRENT_KERNEL" ]; then
    echo -e "${RED}ATENÇÃO: Um novo Kernel foi instalado.${NC}"
    echo -e "${YELLOW}Recomendado reiniciar o servidor para aplicar as mudanças.${NC}"
    echo "Deseja reiniciar agora? (s/n)"
    read -r reboot_resp
    if [[ "$reboot_resp" =~ ^([sS][imIM]|[sS])$ ]]; then
        reboot
    fi
else
    echo -e "${GREEN}Nenhuma reinicialização do Kernel é necessária.${NC}"
fi

echo -e "${GREEN}Processo concluído.${NC}"
