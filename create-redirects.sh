#!/bin/bash
set -e
# Description:
# This script will create a index.php file for every directory found 
# and then it will redirect you to the root domain. This script is useful
# for some domains or projects that don't have a defined pattern or that
# serve more generalized scripts instead of dedicated applications.
#
# Author: Austin Kregel <github@kbco.me>
USAGE="Usage ./create-redirects.sh {root-directory}"

validateInput() {
    if [ -z "$1" ]; then
        echo ""
        echo $2;
        echo $USAGE
        exit 1;
    fi
}

ROOT_DIR=$1

validateInput "$ROOT_DIR" "You must enter the root directory to scan from."

for dir in $(find . -type d); do
    TMP_DIR=$dir/index.php
    if [ ! -f $TMP_DIR ]; then
        cat > $TMP_DIR << EOF 
<?php
header('Location: /');

EOF
   	echo $TMP_DIR
    fi
done
