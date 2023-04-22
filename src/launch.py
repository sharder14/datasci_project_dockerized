import os
import subprocess
import re
import time
time.sleep(5)
"""
url=subprocess.run(
    [
        'docker',
        'exec',
        'ccf',
        'jupyter',
        'server',
        'list'
    ]
    ,capture_output=True
)
"""
url=subprocess.run(
    [
        'jupyter',
        'server',
        'list'
    ]
    ,capture_output=True
)

outputstring=str(url.stderr)
#print(outputstring)
#p=re.compile(r"token=([^\s]+)")

p=re.compile(r"(?<=token=)(.*?)(?=\s)")
token=p.search(outputstring)
token=token.group(0)
url='http://127.0.0.1:8888/lab?token='+token
print(url)