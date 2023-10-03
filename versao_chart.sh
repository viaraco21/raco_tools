#!/bin/bash

# Nome do arquivo HTML
file_name="./PSI_LOG .html"

# Use o sed para fazer a substituição da versão
sed -i 's/\(v[0-9]\+\.[0-9]\+\.\)[0-9]\+/\1'$(($(sed -n 's/.*v\([0-9]\+\.[0-9]\+\.\)\([0-9]\+\).*/\2/p' "$file_name")+1))'/' "$file_name"

# Exibir uma mensagem de conclusão
echo "Substituição concluída no arquivo: $file_name"
