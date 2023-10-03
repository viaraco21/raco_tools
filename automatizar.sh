# código faz solicitações para o TDN (Totvs Developer Network)
#!/bin/bash

# Defina suas credenciais do TDN
USERNAME="renato.aurelio@totvs.com.br"
PASSWORD="Sarah2023@#$%!"

# Use o comando curl para autenticar no TDN e obter um token de acesso
TOKEN=$(curl -X POST -H "Content-Type: application/json" -d "{\"username\":\"$USERNAME\",\"password\":\"$PASSWORD\"}" https://tdn.totvs.com/api/authentication | jq -r '.token')

# Use o token para fazer uma solicitação GET no TDN (substitua a URL pelo endpoint desejado)
curl -X GET -H "Authorization: Bearer $TOKEN" https://tdn.totvs.com/api/seu-endpoint-aqui

# Certifique-se de substituir "seu-endpoint-aqui" pela URL real que você deseja acessar com a solicitação GET.

# Você pode adicionar mais opções ao comando curl conforme necessário, dependendo dos requisitos da sua solicitação GET.

echo "Solicitação GET concluída com sucesso!"

# comando curl para criar uma nova página no Confluence

#!/bin/bash

# Defina suas credenciais do Confluence
USERNAME="admin"
PASSWORD="admin"

# Use o comando curl para criar uma nova página no Confluence
curl -u $USERNAME:$PASSWORD -X POST -H 'Content-Type: application/json' -d '{
  "type": "page",
  "title": "new page",
  "space": {"key": "TST"},
  "body": {
    "storage": {
      "value": "<p>This is <br/> a new page</p>",
      "representation": "storage"
    }
  }
}' http://localhost:8080/confluence/rest/api/content/ | python -mjson.tool


#!/bin/bash

# Defina suas credenciais do Confluence
USERNAME="admin"
PASSWORD="admin"

# Caminho para o arquivo HTML para usar como conteúdo da página
HTML_FILE="/file:/home/raco/Downloads/PSI_LOG%20(2).html"

# Ler o conteúdo do arquivo HTML em uma variável
HTML_CONTENT=$(cat "$HTML_FILE")

# o comando curl cria uma nova página no Confluence com o conteúdo HTML
curl -u $USERNAME:$PASSWORD -X POST -H 'Content-Type: application/json' -d '{
  "type": "page",
  "title": "Pacotes Aplicados",
  "space": {"key": "TST"},
  "body": {
    "storage": {
      "value": "'"$HTML_CONTENT"'",  # Insira o conteúdo HTML aqui
      "representation": "storage"
    }
  }
}' http://localhost:8080/confluence/rest/api/content/ | python -mjson.tool


#!/bin/bash

# Define o novo título que você deseja colocar no HTML
novo_titulo="Novo Título da Página"

# Define o caminho para o arquivo HTML
caminho_html="/file:/home/raco/Downloads/PSI_LOG%20.html"

# Usa o comando sed para substituir o título existente pelo novo título no arquivo HTML
sed -i "s/<title>.*<\/title>/<title>$novo_titulo<\/title>/" "$caminho_html"

# Exibe uma mensagem de confirmação
echo "Título do HTML atualizado para: $novo_titulo"