#!/bin/bash

export FLASK_APP=main
export FLASK_ENV=development
export FLASK_DEBUG=1

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  CURR_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$CURR_DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done

CURR_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )/"
FILE_NAME='RPI5_2021_06_10_temp_hum.txt'

cd $CURR_DIR

export DATA_FILE=$CURR_DIR$FILE_NAME

flask run
