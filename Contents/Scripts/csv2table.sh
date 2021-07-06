#!/bin/bash
  
LAST_COL_MAX_LENGTH=16

if [ $# -ne 1 ] ; then
  echo "Usage: $0 < CSV_FILE >" 1>&2
  exit 1
fi
INPUT_FILE="$1"
if [ ! -f "${INPUT_FILE}" ]; then
  echo "File: ${INPUT_FILE} not found!" 1>&2
  exit 2
fi

INPUT="${INPUT_FILE}"
HEADER=$(cat $INPUT | sed -n '1p')
DATA=$(cat $INPUT | sed -n '2,$p')
NON_LAST_COL=$(echo $HEADER | sed 's/[^,]*$//')
LAST_COL=$(echo $HEADER | sed 's/.*,\([^,]*\)$/\1/')
LAST_COL_LENGTH=${#LAST_COL}
PADDING=$(head -c $(expr ${LAST_COL_MAX_LENGTH} - $LAST_COL_LENGTH) /dev/zero | tr '\0' ' ')
HEADER=$(echo "${NON_LAST_COL}${PADDING}${LAST_COL}")
COLS=$(echo "$HEADER" | sed 's/,/ , /g')
LINES=$(echo "$COLS" | sed 's/[^,]/-/g' | tr ',' '+')

DATA=$(echo "$DATA" | sed 's/,/ , /g')
TABLE=$(echo "$DATA" | column -s, -t -o '|' -N "$COLS" -R "$COLS")
TABLE_HEADER=$(echo "$TABLE" | sed -n '1p')
TABLE_DATA=$(echo "$TABLE" | sed -n '2,$p')

echo "$LINES"
echo "$TABLE_HEADER"
echo "$LINES"
echo "$TABLE_DATA"
echo "$LINES"
