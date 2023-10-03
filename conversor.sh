#!/bin/bash

# Nome do arquivo de entrada e saída
entrada="./applypatch.log"
saida="Log de aplicação dos pacotes em ADVPL Appserver.html"

# Cabeçalho HTML
echo "<html>" > "$saida"
echo "<head>" >> "$saida"
echo "<title>Seu Arquivo HTML</title>" >> "$saida"
echo "</head>" >> "$saida"
echo "<body>" >> "$saida"

# Lê o arquivo de texto e converte cada linha em um parágrafo HTML
while IFS= read -r linha
do
  echo "<p>$linha</p>" >> "$saida"
done < "$entrada"

# Fecha as tags HTML
echo "</body>" >> "$saida"
echo "</html>" >> "$saida"

echo "Arquivo HTML gerado: $saida"
