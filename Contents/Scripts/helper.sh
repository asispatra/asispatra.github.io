#!/bin/bash
  
function line () {
  SEP_CHAR="="
  SEP_CHAR_LEN=80
  if [ ! -z "$1" ]; then
    re='^[0-9]+$'
    if [[ $1 =~ $re ]] ; then
      SEP_CHAR_LEN=$1
    else
      SEP_CHAR=$1
    fi
  fi
  if [ ! -z "$2" ]; then
    re='^[0-9]+$'
    if [[ $2 =~ $re ]] ; then
      SEP_CHAR_LEN=$2
    else
      SEP_CHAR=$2
    fi
  fi
  printf "%"$SEP_CHAR_LEN"s" | tr " " "$SEP_CHAR"
  if [ $SEP_CHAR_LEN -eq 80 ] ; then echo; fi
}

function header () {
  SEP_CHAR="="
  STR="$1"
  if [ ! -z "$2" ]; then
    SEP_CHAR=$2
  fi
  CHAR_LEN=${#STR}
  LEN=80
  SEP_CHAR_LEN=$(expr $LEN - $CHAR_LEN)
  SEP_CHAR_LEN=$(expr $SEP_CHAR_LEN / 2 - 1)
  line ${SEP_CHAR_LEN} "${SEP_CHAR}"
  echo -n " $STR "
  line ${SEP_CHAR_LEN} "${SEP_CHAR}"
  SEP_CHAR_LEN=$(expr $LEN - $(expr $SEP_CHAR_LEN \* 2 + $CHAR_LEN + 2))
  line ${SEP_CHAR_LEN} "${SEP_CHAR}"
  echo
}
