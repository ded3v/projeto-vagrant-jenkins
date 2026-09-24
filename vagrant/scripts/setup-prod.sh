
#!/bin/bash
set -e

# Atualiza a lista de pacotes
apt-get update

# Instala os pacotes necessarios para configurar o repositorio
apt-get install -y curl ca-certificates

# Configura o repositorio do Node.js 22
curl -fsSL https://deb.nodesource.com/setup_22.x | bash -

# Instala o Node.js e o npm
apt-get install -y nodejs

# Verifica se a instalacao foi concluida
if node --version && npm --version; then
    echo "Node.js e npm instalados com sucesso"
else
    echo "Erro: Node.js e/ou npm nao foram instalados corretamente"
    exit 1
fi