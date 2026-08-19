#!/bin/bash
# Log analyzer: berilgan log faylini tahlil qiladi

LOGFILE=$1

if [[ -z $LOGFILE || ! -f $LOGFILE ]]
then
  echo "Iltimos, mavjud log faylni argument sifatida bering: ./log_analyzer.sh access.log"
  exit 1
fi

echo -e "\n~~ Log Analyzer ~~\n"
echo "Fayl: $LOGFILE"
echo "Jami qatorlar: $(wc -l < $LOGFILE)"
echo "ERROR soni: $(grep -c .ERROR $LOGFILE)"
echo "WARNING soni: $(grep -c WARNING $LOGFILE)"
echo "INFO soni: $(grep -c INFO $LOGFILE)"

echo -e "\nEng faol IP manzillar:"
cut -d ' ' -f 4 $LOGFILE | sort | uniq -c | sort -rn | head -3

