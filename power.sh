#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Use arguments 'start' to launch container, 'stop' to stop container, 'restart' to restart container, 'url' for url, 'delete' to remove container"
    exit 1
else
    if [ $1 == 'start' ]; then
        docker run -d -p 8888:8888 --name=datasci -v $PWD/src:/src datasci
        docker exec datasci python launch.py
    elif [ $1 == 'stop' ]; then
        docker container stop datasci
    elif [ $1 == 'restart' ]; then
        docker container start datasci
        docker exec datasci python launch.py
    elif [ $1 == 'url' ]; then
        docker exec datasci python launch.py
    elif [ $1 == 'delete' ]; then
        docker container stop datasci
        docker container rm datasci
    else echo "use the following flags: 'start','stop','restart','url','delete'"
    fi
fi
