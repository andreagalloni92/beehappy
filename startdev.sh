#!/bin/bash

export FLASK_APP=main
export FLASK_ENV=development
export FLASK_DEBUG=1

echo $(dirname $0)
echo "dirname/readlink: $(dirname $(readlink -f $0))"

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

export DATA_FILE=$DIR'/RPI5_2021_06_10_temp_hum.txt'

# echo $DATA_FILE

flask run
