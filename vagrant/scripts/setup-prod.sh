apt-get update
apt-get install -y nodejs npm

if node --version && npm --version; then
    echo "Node.js e npm instalados com sucesso"
else
    echo "Erro: Node.js e/ou npm não foram instalados corretamente"
    exit 1
fi