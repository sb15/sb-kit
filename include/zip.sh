#!/bin/bash

check_zip_installed() {
    if ! command -v zip >/dev/null 2>&1; then
        echo "zip not installed"
        return 1
    fi
    return 0
}

zip_archive_with_parts_2g()
{
    check_zip_installed || exit 1

    local DIR
    local BASENAME
    DIR=$(dirname "$1")
    BASENAME=$(basename "$1")

    cd "$DIR" || exit 1

    zip -q -0 -r -s 2g "$2" "$BASENAME"
}

zip_archive_for_capsule()
{
    check_zip_installed || exit 1

    local DIR
    local BASENAME
    DIR=$(dirname "$1")
    BASENAME=$(basename "$1")

    cd "$DIR" || exit 1

    if [ "$3" = "sudo" ]; then
        local USER
        USER=$(whoami):$(id -gn)

        sudo zip -q -r -FS "$2" "$BASENAME"
        sudo chown "${USER}" "$2"
    else
        zip -q -r -FS "$2" "$BASENAME"
    fi

}
