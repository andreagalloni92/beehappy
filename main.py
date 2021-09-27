from flask import render_template
import json

import beehappy
from beehappy import app
import config


# Route to Home Page
@app.route("/")
def home():
    return render_template('base.html', page_title=config.WEBSITE_TITLE)

# Simple route for data 
@app.route("/api/data")
def data():
    with open(beehappy.DATA_FILE) as fobj:
        lns=[ i for i in fobj.read().splitlines() ]
    
    pretty = [None]*len(lns)
    
    for i, l in enumerate(lns):
        ll = l.split(' ')
        pretty[i] = {
            'datetime':ll[0] + ' ' + ll[1][:-1],
            'temperature':float(ll[2].split('=')[1][:-2]),
            'humidity':float(ll[3].split('=')[1][:-1])
            }
    print(len(pretty))

    return json.dumps(pretty[-1000::10])
