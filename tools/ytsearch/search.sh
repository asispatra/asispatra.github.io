#!/bin/bash
TARGET=$(echo "$1" | sed 's/\ /%20/g')
#curl "https://suggestqueries-clients6.youtube.com/complete/search?client=youtube&ds=yt&q=${TARGET}" | sed 's/.*(\(.*\)).*/\1/'
#curl "https://suggestqueries-clients6.youtube.com/complete/search?client=youtube&ds=yt&q=${TARGET}" | sed 's/.*(\(.*\)).*/\1/' | jq "{data: .}"
curl "https://suggestqueries-clients6.youtube.com/complete/search?client=youtube&ds=yt&q=${TARGET}" | sed 's/.*(\(.*\)).*/\1/' | jq ".[1][] | {data: .[0], value: .[2]}" | jq -s .
