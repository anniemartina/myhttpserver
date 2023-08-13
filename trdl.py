#!/usr/bin/env python3
"""
TRDL Flask Application
"""
import os
from flask import Flask

app = Flask(__name__)

def app_obj():
    """
    Create and return Flask object
    """
    return app


@app.route("/")
def trdl():
    return "42"

if __name__ == "__main__":
    port = int(os.environ.get('PORT', 80))
    app.run(debug=True, host='0.0.0.0', port=port)
