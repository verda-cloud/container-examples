#!/bin/bash
if [ -z "$VERDA_CONTAINER_URL" ] || [ -z "$VERDA_BEARER_TOKEN" ]; then
  echo "Error: VERDA_CONTAINER_URL and VERDA_BEARER_TOKEN environment variables must be set"
  exit 1
fi

curl -X GET "$VERDA_CONTAINER_URL/health" \
--header "Authorization: Bearer $VERDA_BEARER_TOKEN" \
--header "Content-Type: application/json"
