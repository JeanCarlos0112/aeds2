#!/bin/bash
# Autor: Jean Carlos Lopes Lellis
# make: compilar e executar testes automáticos em Java
#
# Uso: ./make programa
#      (sem a extensão .java)

# Limpar a tela
clear

# Definir variáveis (sem espaços)
JC="javac"
J="java"
# Atualize estes caminhos conforme necessário para seu ambiente Linux
libpath="../../../../fonte/ajuda/java"
lib="../../../../fonte/ajuda/java/MyIO.java"
main="$PWD/$1.java"

# Limpar arquivos de compilação e saída anteriores
[ -f "$1.class" ] && rm "$1.class"
[ -f "teste.out" ] && rm "teste.out"

# Compilar o código
if [ -f "$1.java" ]; then
    $JC -cp "$libpath" "$lib" "$main"
    if [ $? -ne 0 ]; then
        echo -e "\e[31mErro de compilação! Verifique as mensagens acima.\e[0m"
        read -p "Pressione ENTER para continuar..."
        exit 1
    fi
else
    echo "Arquivo $1.java não encontrado!"
    exit 1
fi

# Executar o código
if [ -f "$1.class" ]; then
    $J -cp "$PWD:$libpath" $1 < pub.in > teste.out
    if [ $? -ne 0 ]; then
        echo -e "\e[31mErro na execução! Verifique as mensagens acima.\e[0m"
        read -p "Pressione ENTER para continuar..."
        exit 1
    fi
else
    echo "Arquivo $1.class não encontrado!"
    exit 1
fi

# Comparar os arquivos de saída usando diff
diff -w teste.out pub.out
if [ $? -ne 0 ]; then
    echo
    echo "DIFERENÇAS ENCONTRADAS NAS SAÍDAS"
    # Caso deseje exibir o conteúdo de teste.out, descomente as linhas abaixo:
    echo "EXIBIÇÃO DO ARQUIVO teste.out:"
    cat teste.out
    read -p "Pressione ENTER para continuar..."
fi

