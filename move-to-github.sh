#!/bin/bash
set -e

# Author: Thomas Schultz <tom@apixo.co>
# Usage: ./move-to-github.sh <origin-repo> <new-repo>

git clone --mirror  ${1} tmp-project

cd tmp-project

git remote set-url --push origin  ${2}

git push --mirror

cd ..

rm -rf tmp-project
