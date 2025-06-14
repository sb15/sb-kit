#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../include/zip.sh"

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo "Использование: pack2g <путь_к_папке> <имя_архива.zip>"
    echo "Архивирует папку в zip-архив с частями по 2ГБ."
    exit 0
fi

if [[ $# -ne 2 ]]; then
    echo "Использование: pack2g <путь_к_папке> <имя_архива.zip>"
    exit 1
fi

zip_archive_with_parts_2g "$1" "$2"
