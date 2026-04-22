# what block height was this tx mined ?
# 49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb

#!/bin/bash

tx=$(bitcoin-cli getrawtransaction 49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb true)

echo "$tx" | jq -r '.blockhash' | xargs bitcoin-cli getblock | jq '.height'