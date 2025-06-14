#!/bin/bash

function create_ssh_key
{
    local KEY_NAME="$1"
    local FILENAME=~/.ssh/"$KEY_NAME"

    if [[ -e "$FILENAME" || -e "$FILENAME.pub" ]]; then
        echo "Файл $FILENAME или $FILENAME.pub уже существует."
        return 1
    fi

    ssh-keygen -t rsa -b 4096 -f "$FILENAME"
}
