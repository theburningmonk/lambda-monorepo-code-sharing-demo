#!/bin/bash
set -e

for path in $(ls projects); do
    if [[ -d "projects/$path" ]]
    then
        echo "deploying $path"

        npm ci
        npm run deploy -- -s $STAGE
    else 
        continue
    fi
done