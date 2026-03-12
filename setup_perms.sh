#!/bin/bash

echo "Buscando scripts shell e aplicando permissões de execução..."

# Encontra todos os arquivos (-type f) terminados em .sh e executa o chmod neles
find . -type f -name "*.sh" -exec chmod +x {} +

echo "Permissões configuradas com sucesso."
