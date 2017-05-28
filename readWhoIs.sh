#!/bin/bash

while read p; do
	whois $p >> information.csv
	curl freegeoip.net/xml/$p >>site-info.csv
done <fraudList.csv


#Remove white spaces
while read -r line; do echo "$line" >> whoisList.csv; done < information.csv

while read -r line; do echo "$line" >> ipadd.csv; done < site-info.csv


#For Registrar files
awk '/^Registrar:/ { print }' whoisList.csv >> registrar.csv

# For updated on
awk '/^Updated Date:/ { print }' whoisList.csv >> Updated_Date.csv

# For updated on
awk '/^Creation Date:/ { print }' whoisList.csv >> Creation_Date.csv

# For updated on
awk '/^Expiration Date:/ { print }' whoisList.csv >> Expiration_Date.csv