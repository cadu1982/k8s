#!/bin/bash

# while true; do
#     echo "Nova consulta a cada 5 segundos!!!"
#     kubectl get pods -n autbank-pix | awk '$1 ~ /^api-pagamento-instantaneo-[[:alnum:]]+-[[:alnum:]]+$/ {print $1}'
#     sleep 5
# done

#!/bin/bash

# Inicializa a variável de tempo com 0
tempo=0
consulta=0

while true; do
    # Exibe a mensagem com o numero de consulatas e o tempo total da soma de todas as consultas 
    echo "Esta é a $consulta consulta e já faz $tempo segundos!!!"
    
    # Executa o comando kubectl e filtra os nomes
    kubectl get pods -n autbank-pix | awk '$1 ~ /^api-pagamento-instantaneo-[[:alnum:]]+-[[:alnum:]]+$/ {print $1}'
    
    # Incrementa o tempo em 5 segundos
    ((tempo+=5))
    
    # Incrementa o numero de consultas 
    ((consulta+=1))
    
    # Pausa a execução por 5 segundos
    sleep 5
done

