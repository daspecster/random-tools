#!/bin/bash
set -e

# Author: Thomas Schultz <tom@apixo.co>
USAGE="Usage ./move-to-github.sh {origin-repo-branch} {new-repo-url}"

validateInput() {
    if [ -z "$1" ]; then
        echo ""
        echo $2;
        echo $USAGE
        exit 1;
    fi
}

ORIGIN=$1
NEWREPO=$2

validateInput "$ORIGIN" "You must enter the origin repository's branch name"
validateInput "$NEWREPO" "You must enter the URL to the new repository"

git clone --mirror  $ORIGIN tmp-project

cd tmp-project

git remote set-url --push origin  $NEWREPO

git push --mirror

cd ..

rm -rf tmp-project

