#!/bin/bash

export FLASK_APP=main
export FLASK_ENV=development
export FLASK_DEBUG=1
export DATA_FILE='/home/andrea/Documents/personal_projects/beehappy/RPI5_2021_06_10_temp_hum.txt'

flask run
