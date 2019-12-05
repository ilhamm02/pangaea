#!/bin/bash

one_address=""
while [$one_address == ""]
do
        read -p "Please provide your $ONE address:" one_address
done

one_directory=""
while [$one_directory == ""]
do
        read -p "Please provide your $ONE ./hmy directory (default for root user is in root):" one_directory
done

echo -e "${GREEN} Please wait..."

rm -rf balances.sh
{
        echo '#!/bin/bash'
        echo ''
		    echo 'echo Your wallet address is '$one_address''
        echo 'cd '$one_directory''
        echo './hmy --node="https://api.s0.p.hmny.io" balances '$one_address''
} >balances.sh
chmod a+x balances.sh

echo -e "${GREEN} Successed. Please run ./balances to check your balances."
