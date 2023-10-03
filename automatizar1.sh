#!/bin/bash

# Define o nome do arquivo de entrada e saída
entrada="./PSI LOG"
saida="Aplicação dos pacotes de correção:.html"

# Utiliza o comando 'sed' para realizar a substituição no arquivo HTML
sed 's/<h1 id="id-1.SmartERPProtheusNovidades-ConheçaasnovidadesdoSmartERPProtheus!"><strong>Conheça as novidades do SmartERP Protheus!<\/strong>/<h1>Nova linha de título aqui/g' "$entrada" > "$saida"

# Exibe uma mensagem de conclusão
echo "Substituição concluída. O arquivo de saída é: $saida"

########################################

#!/bin/bash

# Nome do arquivo HTML
file_name="./PSI LOG"

# Conteúdo a ser substituído
replacement_content="<p>./templete1.html</p>"

# Escapando os caracteres especiais na expressão de substituição
escaped_content=$(echo "$replacement_content" | sed -e 's/[]\/$*.^[]/\\&/g')

# Usando o sed para fazer a substituição
sed -i "s/\*\*\*\*PATHS\*\*\*\*/$escaped_content/g" "$file_name"

# Exibe uma mensagem de conclusão
echo "Substituição concluída no arquivo: $file_name"

############################################

#!/bin/bash

# Nome do arquivo HTML
file_name="./PSI LOG"

# Nome do arquivo de template
template_file="./template1"

# Lê o conteúdo do arquivo de template
template_content=$(cat "$template_file")

# Escapa as barras e caracteres '&' no conteúdo do template
escaped_template_content=$(sed 's/[\/&]/\\&/g' <<< "$template_content")

# Usando o sed para fazer a substituição
sed -i "s/\*\*\*\*PATHS\*\*\*\*/$escaped_content/g" "$file_name"

# Exibe uma mensagem de conclusão
echo "Substituição concluída no arquivo: $file_name"

############################################

#!/bin/bash

# Nome do arquivo HTML
file_name="./PSI LOG"

# Nome do arquivo de template
template_file="./template1"

# Ler o conteúdo do arquivo de template
template_content=$(<"$template_file")

# A linha de código replacement_location="****PATHS****" cria uma variável chamada replacement_location e atribui a ela a string "****PATHS****" como seu valor.
replacement_location="****PATHS****"

# realiza uma transformação no conteúdo da variável template_content e armazena o resultado na variável escaped_template_content
escaped_template_content=$(sed 's/[\/&]/\\&/g' <<< "$template_content")

# Usar awk para fazer a substituição
awk -v replace="$escaped_template_content" '{gsub(replacement_location, replace)}1' "$file_name" > tmpfile && mv tmpfile "$file_name"

# Exibir uma mensagem de conclusão
echo "Substituição concluída no arquivo: $file_name"

###########################################

#!/bin/bash

# Nome do arquivo HTML
file_name="./PSI_LOG .html"

# Nome do arquivo de template
template_file="./template1"

# Ler o conteúdo do arquivo de template e armazena na variavel template_content
template_content=$(<"$template_file")

# Define uma variável chamada replacement_location com o valor "PATHS". 
# Essa variável é usada para armazenar o local onde você deseja realizar a substituição no arquivo HTML.
replacement_location="\*\*\*\*PATHS\*\*\*\*"

# Usar awk para fazer a substituição apenas na linha desejada
# awk = ferramenta de processamento de texto
awk -v replace="$template_content" "/$replacement_location/ {sub(/$replacement_location/, replace)}1" "$file_name" > tmpfile && mv tmpfile "$file_name"

# Exibir uma mensagem de conclusão
echo "Substituição concluída no arquivo: $file_name"