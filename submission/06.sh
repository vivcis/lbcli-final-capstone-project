# Only one tx in block 243,821 signals opt-in RBF. What is its txid?

#!/bin/bash

blockhash=$(bitcoin-cli getblockhash 243821)
block=$(bitcoin-cli getblock "$blockhash" 2)

echo "$block" | jq -r '.tx[] | select(.vin[] | .sequence < 4294967294) | .txid' | head -1
