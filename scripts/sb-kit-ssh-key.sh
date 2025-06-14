#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../include/ssh.sh"

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo "Использование: sb-kit-ssh-key <имя_файла>"
    echo "Создание ключа ssh"
    exit 0
fi

if [[ $# -ne 1 ]]; then
    echo "Использование: sb-kit-ssh-key <имя_файла>"
    exit 1
fi

create_ssh_key "$1"
