#!/bin/bash
TARGET=$1
#youtube-dl -j "${TARGET}" | jq -r ".tags[]" | tr '\n' ',' | sed 's/,$//'
youtube-dl -j "${TARGET}" | jq "{tags: .tags}"
