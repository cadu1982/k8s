#!/bin/bash

SERVICE_URL="http://192.168.5.161:30305/docs"

# Função para fazer as chamadas curl
make_curl_request() {
  local url="$1"
  curl -s "$url" -o /dev/null
}

# Loop para aumentar gradativamente o número de chamadas
for num_requests in {100..1000..100}; do
  echo "Fazendo $num_requests chamadas para $SERVICE_URL"
  
  # Faz as chamadas de acordo com o número atual de requisições
  for ((i=1; i<=$num_requests; i++)); do
    make_curl_request "$SERVICE_URL" &
  done
  
  # Aguarda 10 segundos antes de aumentar o número de requisições
  sleep 3
done

echo "Concluído!"
