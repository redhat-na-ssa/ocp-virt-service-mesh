#!/bin/bash

# script to start app on fresh linux install

# make sure pip is installed
sudo yum -y install python3-pip
pip install --upgrade pip
pip install -r requirements.txt
uvicorn main:app --host 0.0.0.0 --port 8080