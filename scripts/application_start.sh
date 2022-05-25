#!/bin/bash

# Stop all servers and start the server as a daemon
cd /home/ubuntu/microservice-node/
npm install forever -g
forever stopall
npm install
forever start /home/ubuntu/microservice-node/app.js