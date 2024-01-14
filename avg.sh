#!/bin/bash

read -p "Enter buy price : " bp
read -p "Enter quantity : " bq

read -p "Enter average buy price : " ap
read -p "Enter quantity : " aq

total_stock=$(echo "${bq}+${aq}" | bc)
total_price=$(echo "${bp}*${bq}+${ap}*${aq}" | bc)

avg_price=$(echo "scale=2; $total_price/${total_stock}" | bc)

echo "Average price for quantity ${total_stock} is ${avg_price}"


