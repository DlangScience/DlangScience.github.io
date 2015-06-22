#!/usr/bin/env python3

import json
import sys
import requests

data = json.loads('{}')
data['text'] = open(sys.argv[1], "r").read()
data['mode'] = 'gfm'

r = requests.post("https://api.github.com/markdown", data=json.dumps(data), headers={'Content-Type': 'application/json'})

print(r.text)
