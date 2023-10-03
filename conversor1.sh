#!/bin/bash

# Nome do arquivo de entrada e saída
entrada="./Log de Pacotes aplicados"
saida="Pacotes aplicados.html"

# cria um arquivo temporário para armazenar as alterações
temp_file="temp.txt"

# Mantém as últimas dez linhas do arquivo original e exclui as linhas contendo "techfin"
tail -n 10 "$entrada" | grep -v "techfin" > "$temp_file"

# Cabeçalho HTML
echo "<html>" > "$saida"
echo "<head>" >> "$saida"
echo "<title>Seu Arquivo HTML</title>" >> "$saida"
echo "</head>" >> "$saida"
echo "<body>" >> "$saida"

# Lê o arquivo de texto temporário e converte cada linha em um parágrafo HTML
while IFS= read -r linha
do
  echo "<p>$linha</p>" >> "$saida"
done < "$temp_file"

# Fecha as tags HTML
echo "</body>" >> "$saida"
echo "</html>" >> "$saida"

echo "Arquivo HTML gerado: $saida"

# Remove o arquivo temporário
rm "$temp_file"
