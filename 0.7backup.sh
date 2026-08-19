#!/bin/bash
# Backup tool: berilgan papkalarni arxivlaydi va log yuritadi

BACKUP_DIR=~/backups
LOG_FILE=backup.log
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

mkdir -p $BACKUP_DIR

echo -e "\n~~ Backup Tool ~~\n"

if [[ $# -eq 0 ]]
then
  echo "Foydalanish: ./backup.sh <papka1> <papka2> ..."
  exit 1
fi

FOLDERS=("$@")

for FOLDER in "${FOLDERS[@]}"
do
  if [[ -d $FOLDER ]]
  then
    ARCHIVE_NAME="${FOLDER}_${TIMESTAMP}.tar.gz"
    tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" "$FOLDER"
    echo "[$TIMESTAMP] OK: $FOLDER -> $ARCHIVE_NAME" >> $LOG_FILE
    echo "✔ $FOLDER zaxiralandi: $ARCHIVE_NAME"
  else
    echo "[$TIMESTAMP] XATO: $FOLDER topilmadi" >> $LOG_FILE
    echo "✘ $FOLDER topilmadi, o'tkazib yuborildi"
  fi
done

echo -e "\nBarcha amallar $LOG_FILE fayliga yozildi."

