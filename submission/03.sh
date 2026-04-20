# Which tx in block 216,351 spends the coinbase output of block 216,128?

#!/bin/bash

#get the coinbase txid from block 216128
HASH_128=$(bitcoin-cli -regtest getblockhash 216128)
BLOCK_128=$(bitcoin-cli -regtest getblock "$HASH_128")
COINBASE_TXID=$(echo "$BLOCK_128" | jq -r '.tx[0]')

#then get all the  txs in block 216351 with full details
HASH_351=$(bitcoin-cli -regtest getblockhash 216351)
BLOCK_351=$(bitcoin-cli -regtest getblock "$HASH_351" 2)

#find which tx spends the coinbase output
echo "$BLOCK_351" | jq -r --arg cb "$COINBASE_TXID" \
  '.tx[] | select(.vin[] | .txid == $cb) | .txid'