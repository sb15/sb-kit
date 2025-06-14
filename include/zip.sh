#!/bin/bash

check_zip_installed() {
    if ! command -v zip >/dev/null 2>&1; then
        echo "zip not installed"
        return 1
    fi
    return 0
}

zip_pack_with_parts_2g() {

    check_zip_installed || exit 1

    DIR=$(dirname "$1")
    BASENAME=$(basename "$1")

    cd "$DIR" || exit 3

    zip -q -r -s 2g "$2" "$BASENAME"
    
}
