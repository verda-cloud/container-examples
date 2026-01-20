#!/bin/bash
if [ -z "$VERDA_DEPLOYMENT" ] || [ -z "$VERDA_BEARER_TOKEN" ]; then
  echo "Error: VERDA_DEPLOYMENT and VERDA_BEARER_TOKEN environment variables must be set"
  exit 1
fi

PAYLOAD='{
  "url": "https://tile.loc.gov/storage-services/media/ls/sagan/1958124-3-1.mp3"
}'

ENDPOINT="https://containers.datacrunch.io/$VERDA_DEPLOYMENT/generate" 
echo "Performing async inference at $ENDPOINT"

curl -X POST $ENDPOINT \
--header "Authorization: Bearer $VERDA_BEARER_TOKEN" \
--header "Content-Type: application/json" \
--header "Prefer: respond-async" \
--data "$PAYLOAD"