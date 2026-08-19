#!/bin/bash
set -euo pipefail

# Safe Deploy: xatolarni boshqaradigan deploy simulyatori

STEP="boshlanish"

rollback() {
  local exit_code=$?
  if [[ $exit_code -ne 0 ]]
  then
    echo -e "\n✘ XATO: "$STEP" bosqichida muvaffaqiyatsizlik (kod: $exit_code)"
    echo "↩ Rollback bajarilmoqda..."
  fi
}
trap rollback EXIT

echo -e "\n~~ Safe Deploy ~~\n"

STEP="tekshiruv"
echo "1/3: Muhitni tekshirish..."
sleep 1

STEP="build"
echo "2/3: Loyihani yig'ish (build)..."
sleep 1

STEP="deploy"
echo "3/3: Serverga joylashtirish..."
sleep 1

echo -e "\n✔ Deploy muvaffaqiyatli yakunlandi!"


