#!/bin/bash

# Defina a data original no formato "YYYY-MM-DD"
data_original="2023-09-18" 

# Defina o número de dias para aumentar
dias_aumentar=7

# Use o comando date para calcular a nova data
nova_data=$(date -d "$data_original + $dias_aumentar days" "+%d/%m/%Y")

# Nome do arquivo HTML
file_name="./PSI_LOG .html"

# Construa o padrão de substituição
padrao_substituicao="<time datetime=\"$data_original\" class=\"date-past\">18/09/2023</time> - v1.6.45"
novo_padrao="<time datetime=\"$nova_data\" class=\"date-past\">$nova_data</time> - v1.6.45"

# sed -i: Isso invoca o utilitário "sed" para fazer edições in-place em um arquivo 
# ou seja, para editar diretamente o arquivo fornecido, sem criar um arquivo de saída separado
sed -i "s#$padrao_substituicao#$novo_padrao#g" "$file_name"


# Use o sed para fazer a substituição da versão, define o padrão de substituição do sed
# Ele procura um padrão que comece com "v" e digitos [0-9]para criar um grupo de captura em torno do padrão "vX.Y."
# extrair a parte da versão do arquivo e captura o número após o último ponto
# O -n faz com que o sed só imprima as linhas onde a substituição é bem-sucedida.
# +1: Isso incrementa o número da versão extraído em 1.
sed -i 's/\(v[0-9]\+\.[0-9]\+\.\)[0-9]\+/\1'$(($(sed -n 's/.*v\([0-9]\+\.[0-9]\+\.\)\([0-9]\+\).*/\2/p' "$file_name")+1))'/' "$file_name"

# Exibir uma mensagem de conclusão
echo "Substituição concluída no arquivo: $file_name"
