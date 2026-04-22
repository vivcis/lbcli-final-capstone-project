# what is the coinbase tx in this block 243,834

#!/bin/bash

blockhash=$(bitcoin-cli getblockhash 243834)
block=$(bitcoin-cli getblock "$blockhash")

echo "$block" | jq -r '.tx[0]'