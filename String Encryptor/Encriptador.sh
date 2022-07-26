#!/bin/bash

n() { echo "a b c d e f g h i j k l m n o p q r c u v x y z" | cut -d"$1" -f1 | tr " " "\n" | wc -l ; }

la() { echo "A B C D E F G H I J K L M N O P Q R C T U V X Y Z" | cut -d" " -f$((($RANDOM%25)+1)); }

echo "---------------------------------------------------------"
echo
read -p "Insira os caracteres -> " entrada #Recebe um argumento
echo "----"
if [ "$entrada" == "" ]; then exit; fi  #Verifica se um argumento é válido, caso contrário o script é descartado
echo "Input Original: $entrada"  #Mostra a string original
echo "---"

passo1="$(echo $entrada | tr "abcdefghijklmnopqrctuvxyz" "zyxvutrcqponmlkjihgfedcba")" #Altera a ordem dos carcteres do input pelo seu oposto

passo2="$(echo $passo1 | tr " " ":")"  #Troca os esoaços do input original pelos dois pontos

passo3="$(echo $passo2 | tr "\n" "@")" #Troca os parágrafos pelo sinbolo do Arroba



#Separa cada caracter com um espaço, e troca cada caracter pelo seu equivalente numérico
passo4="$(for a in $(seq $(echo -n "$passo3" | wc -c)); do
  carac="$(echo "$passo3" | cut -b $a)"

    il="$(echo $carac | grep "[a-z]")"

    if [ "$il" != "" ]; then
      n $carac
    else
      echo "$carac"
    fi
done | tr "\n" " ")"


#Multiplica cada equivalente numérico por ordem
passo5="$(for a in $passo4; do
  in="$(echo $a | grep "[1-9]")"
  if [ "$in" != "" ]; then
    let count++
    echo -n "$(($a*$count))$(la)"
  else
    echo -n "$a$(la)" #Troca os espaços que separam cada número por letras alearórias
  fi
done)"

echo "Input Encriptado:" $passo5

echo 

echo  "---------------------------------------------------------"