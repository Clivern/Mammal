# -*- coding: utf-8 -*-
"""
    Root
    ~~~~~

    :copyright: (c) 2015 by Armin Ronacher.
    :license: BSD, see LICENSE for more details.
"""

import sys
sys.path.append('D:/Root/vendor/')

from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"

if __name__ == "__main__":
    app.run()