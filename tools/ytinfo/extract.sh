#!/bin/bash
TARGET=$1
youtube-dl -j "${TARGET}" | jq "{title: .title, description: .description,tags: .tags}"
