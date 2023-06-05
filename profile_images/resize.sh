#!/bin/bash

shopt -s nullglob

# resize into 400x400 jpg
for f in *.jpg; do
    if [ $(identify -format "%w" "$f") -gt "400" ] || [ $(identify -format "%h" "$f") -gt "400" ]; then
        echo 'converting' $f 'to jpg'
        mogrify -format jpg $f
        echo 'resizing' $f
        mogrify -thumbnail '400x400>' $f
    fi
done
