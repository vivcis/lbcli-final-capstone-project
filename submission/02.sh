# How many new outputs were created by block 243,825?

#!/bin/bash

BLOCKHASH=$(bitcoin-cli getblockhash 243825)
BLOCK=$(bitcoin-cli getblock "$BLOCKHASH" 2)

echo "$BLOCK" | jq '[.tx[].vout | length] | add'