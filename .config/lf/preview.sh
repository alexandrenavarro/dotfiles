#!/bin/sh
# Preview script built for use with lf
LINES=30
case "$1" in
    *.png|*.jpg|*.jpeg|*.mkv|*.mp4) mediainfo "$1";;
    *.zip) zipinfo "$1";;
    *.tar.gz) tar -ztvf "$1";;
    *.tar.bz2) tar -jtvf "$1";;
    *.tar) tar -tvf "$1";;
    *) highlight "$1" -O ansi --force;;
esac
