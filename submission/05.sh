# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb

#!/bin/bash

TX=$(bitcoin-cli getrawtransaction b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb true)


OUT_TOTAL=$(echo "$TX" | jq '[.vout[].value] | add')

IN_TOTAL=$(echo "$TX" | jq -r '.vin[] | "\(.txid) \(.vout)"' | while read txid vout; do
  bitcoin-cli getrawtransaction "$txid" true | jq ".vout[$vout].value"
done | paste -sd+ | bc)

echo "$IN_TOTAL - $OUT_TOTAL" | bc | awk '{printf "%.0f\n", $1 * 100000000}'