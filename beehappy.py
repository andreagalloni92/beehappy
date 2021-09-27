from flask import Flask, render_template
import os

app = Flask(__name__)

DATA_FILE = os.environ.get("DATA_FILE", default='/home/andrea/Documents/personal_projects/beehappy/RPI5_2021_06_10_temp_hum.txt')
