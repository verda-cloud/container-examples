#!/bin/bash
if [ -z "$VERDA_CONTAINER_URL" ] || [ -z "$VERDA_BEARER_TOKEN" ]; then
  echo "Error: VERDA_CONTAINER_URL and VERDA_BEARER_TOKEN environment variables must be set"
  exit 1
fi

echo "Calling API at $VERDA_CONTAINER_URL/generate"

curl -X POST \
-F "file=@audio.wav" \
"$VERDA_CONTAINER_URL/generate" \
--header "Authorization: Bearer $VERDA_BEARER_TOKEN"
