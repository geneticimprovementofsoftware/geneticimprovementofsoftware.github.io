#!/bin/bash

# convert to jpg
shopt -s nullglob
for f in *.png; do
    echo 'converting' $f 'to png'
    mogrify -format jpg $f
done

# resize into 400x400
for f in *.jpg; do
    if [ $(identify -format "%w" "$f") -gt "400" ] || [ $(identify -format "%h" "$f") -gt "400" ]; then
        echo 'resizing' $f
        mogrify -thumbnail '400x400>' $f
    fi
done
