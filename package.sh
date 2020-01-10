#!/bin/bash
set -e

for path in $(ls projects); do
    if [[ -d "projects/$path" ]]
    then
        echo "packaging $path..."

        cd "projects/$path"

        npm ci
        # ensure symlink to libraries were not pruned by npm
        rm -f node_modules/libraries
        ln -s ../../../libraries node_modules/
        ./node_modules/.bin/sls package

        cd $OLDPWD
    else
        continue
    fi
done