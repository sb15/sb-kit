#!/bin/bash

function backup_to_capsule
{
    echo "$1 → $2"

    local DIR="$2"

    local prefix
    local filename

    prefix=$(date +"/%Y/%m")
    filename=$(date +"%Y-%m-%d")

    BACKUP_CAPSULE_DIR="$DIR$prefix"
    mkdir -p "$BACKUP_CAPSULE_DIR"

    BACKUP_CAPSULE="$BACKUP_CAPSULE_DIR/$filename.zip"

    zip_archive_for_capsule "$1" "$BACKUP_CAPSULE" "$3"
}
