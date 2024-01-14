#!/bin/bash

read -p "Enter amount : " amt
read -p "Expected returns : " exr
read -p "Enter ROI : " roi
read -p "Enter day/month/year : " dur


roi=$(echo "scale=2; ${roi}/100" | bc)
cap=$(echo "${amt}+${amt}*${roi}" | bc)
count=1

while [[ 1 -eq $(echo "${cap} <= ${exr}" | bc) ]]
do
	cap=$(echo "${cap}+${cap}*${roi}" | bc)
	((count++))
done

echo "It will take ${count} ${dur}s."

