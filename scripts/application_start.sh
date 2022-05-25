#!/bin/bash

# Stop all servers and start the server as a daemon
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion 
cd /home/ubuntu/microservice-node/
npm install forever -g
forever stopall
npm install
forever start /home/ubuntu/microservice-node/app.js