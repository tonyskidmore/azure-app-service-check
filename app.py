# We now need the json library so we can load and export json data
import json
import os

from flask import Flask, render_template

# Creation of the Flask app
app = Flask(__name__)

@app.route('/')
def healthy():
   return "Healthy"

@app.route('/diags')
def diags():
    with open('./diags.txt', 'r') as f:
       contents = f.read()
    return render_template('template.html', n=contents)

@app.route('/certs')
def certs():
    with open('./certs.txt', 'r') as f:
       contents = f.read()
    return render_template('template.html', n=contents)


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
    # app.run(port=8888, host='0.0.0.0', debug=True)
