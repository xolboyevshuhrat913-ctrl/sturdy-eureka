#!/bin/bash
set -uo pipefail
# System Monitor: disk va xotira holatini tekshiradi, chegaradan oshsa ogohlantiradi

declare -A THRESHOLDS
THRESHOLDS["disk"]=80
THRESHOLDS["memory"]=90

echo -e "\n~~ System Monitor ~~\n"
printf "%-15s %-10s %-10s\n" "Parametr" "Qiymat" "Holat"

DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | tr -d '%')
if (( DISK_USAGE >= THRESHOLDS["disk"] ))
then
  DISK_STATUS="⚠ OGOHLANTIRISH" #curl orqali TG ga xabar yuborish
else
  DISK_STATUS="✔ OK"
fi
printf "%-15s %-10s %-10s\n" "Disk" "${DISK_USAGE}%" "$DISK_STATUS"

MEM_USAGE=$(free | grep Mem | awk '{printf("%.0f", $3/$2 * 100)}')
if (( MEM_USAGE >= THRESHOLDS["memory"] ))
then
  MEM_STATUS="⚠ OGOHLANTIRISH"
else
  MEM_STATUS="✔ OK"
fi
printf "%-15s %-10s %-10s\n" "Xotira" "${MEM_USAGE}%" "$MEM_STATUS"
#!/bin/bash
set -uo pipefail
# System Monitor: disk va xotira holatini tekshiradi, chegaradan oshsa ogohlantiradi

declare -A THRESHOLDS
THRESHOLDS["disk"]=80
THRESHOLDS["memory"]=90

echo -e "\n~~ System Monitor ~~\n"
printf "%-15s %-10s %-10s\n" "Parametr" "Qiymat" "Holat"

DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | tr -d '%')
if (( DISK_USAGE >= THRESHOLDS["disk"] ))
then
  DISK_STATUS="⚠ OGOHLANTIRISH" #curl orqali TG ga xabar yuborish
else
  DISK_STATUS="✔ OK"
fi
printf "%-15s %-10s %-10s\n" "Disk" "${DISK_USAGE}%" "$DISK_STATUS"

MEM_USAGE=$(free | grep Mem | awk '{printf("%.0f", $3/$2 * 100)}')
if (( MEM_USAGE >= THRESHOLDS["memory"] ))
then
  MEM_STATUS="⚠ OGOHLANTIRISH"
else
  MEM_STATUS="✔ OK"
fi
printf "%-15s %-10s %-10s\n" "Xotira" "${MEM_USAGE}%" "$MEM_STATUS"
