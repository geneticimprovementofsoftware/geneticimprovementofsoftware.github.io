#!/bin/bash

shopt -s nullglob

# rename to jpg
for f in *.jpeg; do
    echo 'renaming' $f 'to jpg'
    mv -- "$f" "${f%.jpeg}.jpg"
done

# resize into 400x400
for f in *.jpg; do
    if [ $(identify -format "%w" "$f") -gt "400" ] || [ $(identify -format "%h" "$f") -gt "400" ]; then
        echo 'resizing' $f
        mogrify -thumbnail '400x400>' $f
    fi
done
