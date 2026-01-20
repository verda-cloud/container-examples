#!/bin/bash
if [ -z "$VERDA_DEPLOYMENT" ] || [ -z "$VERDA_BEARER_TOKEN" ]; then
  echo "Error: VERDA_DEPLOYMENT and VERDA_BEARER_TOKEN environment variables must be set"
  exit 1
fi

ENDPOINT=https://containers.datacrunch.io/$VERDA_DEPLOYMENT/health
echo "Connecting to health-check endpoint at $ENDPOINT..."

curl -X GET $ENDPOINT \
--header "Authorization: Bearer $VERDA_BEARER_TOKEN" \
--header "Content-Type: application/json"