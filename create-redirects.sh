#!/bin/bash
set -e

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
header('Location: /index.php');

EOF
   	echo $TMP_DIR
    fi
done
