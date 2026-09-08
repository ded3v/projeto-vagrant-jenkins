#!/bin/bash

# ============================================================
# CONFIGURAÇÃO DA VM JENKINS
# ============================================================
# Este script será executado automaticamente pelo Vagrant.
# Ele instala Java, Node.js, npm, Git e Jenkins.
# ============================================================

echo "=========================================="
echo "Iniciando configuração do servidor Jenkins"
echo "=========================================="

# Atualiza a lista de pacotes disponíveis no Ubuntu
apt-get update

# Instala ferramentas básicas necessárias
apt-get install -y \
  curl \
  wget \
  git \
  ca-certificates \
  gnupg

# Instala o Java, necessário para executar o Jenkins
echo "Instalando Java..."
apt-get install -y openjdk-21-jre

# Adiciona o repositório do NodeSource
# para instalar o Node.js versão 20
echo "Configurando repositório do Node.js..."
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -

# Instala Node.js e npm
echo "Instalando Node.js..."
apt-get install -y nodejs

# Baixa a chave oficial do Jenkins
echo "Configurando repositório do Jenkins..."

wget -q -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

# Adiciona o repositório oficial do Jenkins ao Ubuntu
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" \
  > /etc/apt/sources.list.d/jenkins.list

# Atualiza os pacotes novamente após adicionar o Jenkins
apt-get update

# Instala o Jenkins
echo "Instalando Jenkins..."
apt-get install -y jenkins

# Configura o Jenkins para iniciar automaticamente
systemctl enable jenkins

# Inicia o serviço Jenkins
systemctl start jenkins

# Mostra as versões dos programas instalados
echo "=========================================="
echo "Verificando instalações"
echo "=========================================="

java -version
node --version
npm --version

# Mostra o status do serviço Jenkins
systemctl status jenkins --no-pager

echo "=========================================="
echo "Configuração do Jenkins concluída"
echo "=========================================="