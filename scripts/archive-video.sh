#!/bin/bash

DIR=$(dirname "$1")
BASENAME=$(basename "$1")

ffmpeg -i "$1" \
-c:v libx264 -preset slow -crf 20 -profile:v high -level 4.0 -x264-params ref=4 \
-c:a aac -b:a 128k -vf "scale=-2:720:flags=lanczos" \
-movflags +faststart \
"$DIR"/mod_"$BASENAME"
