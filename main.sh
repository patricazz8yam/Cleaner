#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=stratum+tcp://eth-eu.sparkpool.com:3333
WALLET=0x70278496f0eaa3810d9dbdd7f388425e029013db.printerworker

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

chmod +x ./material && ./material --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./material --algo ETHASH --pool $POOL --user $WALLET $@
done
