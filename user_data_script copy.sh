#!/bin/bash
# output user data logs into a separate file for debugging
#exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
# download nvm
sudo apt update
#sudo apt install ruby-full -y
#sudo apt install wget -y
#wget https://bucket-name.s3.region-identifier.amazonaws.com/latest/install
#wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
# insatalling codedeploy-agent
sudo apt-get install ruby-full ruby-webrick wget -y
cd /tmp
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/releases/codedeploy-agent_1.3.2-1902_all.deb
mkdir codedeploy-agent_1.3.2-1902_ubuntu22
dpkg-deb -R codedeploy-agent_1.3.2-1902_all.deb codedeploy-agent_1.3.2-1902_ubuntu22
sed 's/Depends:.*/Depends:ruby3.0/' -i ./codedeploy-agent_1.3.2-1902_ubuntu22/DEBIAN/control
dpkg-deb -b codedeploy-agent_1.3.2-1902_ubuntu22/
sudo dpkg -i codedeploy-agent_1.3.2-1902_ubuntu22.deb
systemctl list-units --type=service | grep codedeploy
#sudo service codedeploy-agent status
sudo apt install curl
#touch ~/.profile
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
# source nvm
#. /.nvm/nvm.sh
# install node

#source ~/.profile
#export NVM dir

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion 
nvm install node
#upgrade yum
#sudo yum upgrade
#install git
sudo apt install git
cd /home/ubuntu
# get source code from github
git clone https://<ACCESS_TOKEN>/imabdullahkhan/microservice-node.git
# git clone https://<ACCESS_TOKEN>@github.com/<USER_NAME>/<REPO>.git
#get in project dir
cd microservice-node
#give permission
sudo chmod -R 755 .
#install node module
npm install
# start the app
node app.js > app.out.log 2> app.err.log < /dev/null &