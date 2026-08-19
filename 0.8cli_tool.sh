#!/bin/bash
# CLI Tool: flag'lar orqali ishlaydigan universal vosita

usage() {
  echo "Foydalanish: ./cli_tool.sh -n <ism> -a <yosh> [-g]"
  echo "  -n   Ismni kiritish"
  echo "  -a   Yoshni kiritish"
  echo "  -g   Salomlashish xabarini ko'rsatish"
  echo "  -h   Yordam"
}

greet() {
  local name=$1
  local age=$2
  if (( age >= 18 ))
  then
    echo "Salom, $name! Siz kattasiz ($age yosh)."
  else
    echo "Salom, $name! Siz hali $age yoshdasiz."
  fi
}

SHOW_GREETING=false

while getopts "n:a:gh" OPT
do
  case $OPT in
    n) NAME=$OPTARG ;;
    a) AGE=$OPTARG ;;
    g) SHOW_GREETING=true ;;
    h) usage; exit 0 ;;
    *) usage; exit 1 ;;
  esac
done

if [[ -z $NAME || -z $AGE ]]
then
  usage
  exit 1
fi

if [[ $SHOW_GREETING == true ]]
then
  greet "$NAME" "$AGE"
else
  echo "$NAME, $AGE yosh"
fi

