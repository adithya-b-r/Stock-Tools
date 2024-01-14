#!/bin/bash

clear

count=1
total=0
treturns=0

read -p "Enter Initial Amount : " intAmt
read -p "Enter Rate of Interest : " roi
read -p "Enter Number of Months : " month
read -p "Enter Monthly investment : " incAmt

roi=$(echo "scale=2; ${roi}/100" | bc)

while [[ $count -le $month ]]
do
	if [ ${count} -eq 1 ]; then
		returns=$(echo "${roi} * ${intAmt}" | bc)
		total=$(echo "${intAmt} + ${returns}" | bc)
	else
		returns=$(echo "${roi} * ${total}" | bc)
		total=$(echo "${total} + ${returns}" | bc)
	fi

	treturns=$(echo "${treturns} + ${returns}" | bc)
	echo ""
	echo "Month - ${count}"
	echo "Returns : ${returns}"
	echo "Total : ${total}"
	echo "SIP : ${incAmt}"

	total=$(echo "${total} + ${incAmt}" | bc)
	echo "Grand total : ${total}"

	((count++))
done

echo "Total returns : ₹${treturns}"
