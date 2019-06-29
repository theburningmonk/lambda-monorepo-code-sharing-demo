#!/bin/bash
set -e

for path in $(ls projects); do
    if [[ -d "projects/$path" ]]
    then
        echo "deploying $path"

        cd "projects/$path"

        npm ci
        npm run deploy -- -s $STAGE --conceal

        cd $OLDPWD
    else 
        continue
    fi
done