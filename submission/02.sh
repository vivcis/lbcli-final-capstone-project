# How many new outputs were created by block 243,825?

#!/bin/bash

BLOCKHASH=$(bitcoin-cli -regtest getblockhash 243825)
BLOCK=$(bitcoin-cli -regtest getblock "$BLOCKHASH" 2)

echo "$BLOCK" | jq '[.tx[].vout | length] | add'