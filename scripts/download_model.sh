#!/usr/bin/env bash

set -euo pipefail

PROFILE=${1:-dev}
CONFIG="configs/${PROFILE}.yml"

MODEL=$(yq -r '.llm.model' $CONFIG)

echo "Config: $CONFIG"
echo "Model: $MODEL"

if ollama list | grep -q "$MODEL"; then
    echo 'Model already installed'
else
    ollama pull "$MODEL"
fi
