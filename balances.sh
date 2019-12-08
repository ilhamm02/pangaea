#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
DF=`tput sgr0`

one_address=""
while [[ $one_address == "" ]];
do
        read -p "Please provide your $ONE address:" one_address
done

one_directory=""
while [[ $one_directory == "" ]];
do
        read -p "Please provide your $ONE ./hmy directory (default for root user is in /root):" one_directory
done

echo -e "${GREEN} Please wait..."

rm -rf balances.sh
{
	echo '#!/bin/bash'
	echo ''
	echo 'echo Your wallet address is '$one_address''
	echo 'cd '$one_directory''
	echo ''
	echo 'echo "Shard 0 : $(./hmy --node="https://api.s0.p.hmny.io" balances one1jww0ldedhv8w99f8wpz67zn5flwakz844sjvgk | grep -oE ": *.*" | grep -oE -n "*.*00" | grep -i 2 | grep -oP " [0-9].*")"'
	echo 'echo "Shard 1 : $(./hmy --node="https://api.s0.p.hmny.io" balances one1jww0ldedhv8w99f8wpz67zn5flwakz844sjvgk | grep -oE ": *.*" | grep -oE -n "*.*00" | grep -i 4 | grep -oP " [0-9].*")"'
	echo 'echo "Shard 2 : $(./hmy --node="https://api.s0.p.hmny.io" balances one1jww0ldedhv8w99f8wpz67zn5flwakz844sjvgk | grep -oE ": *.*" | grep -oE -n "*.*00" | grep -i 6 | grep -oP " [0-9].*")"'
} >balances.sh
chmod a+x balances.sh

echo -e "${GREEN} Successed. Please run ./balances.sh to check your balances.${DF}"
