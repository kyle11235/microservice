# app is the whole project
# app name has to be lower case

DOCKER_USERNAME=kyle11235
DOCKER_PASSWORD=xxx
APP_NAME=node
MAIN_JS=8080.js
WORKSPACE=$(readlink -f ../../)

printf "\nremove image...\n\n"
sudo docker rmi $DOCKER_USERNAME/$APP_NAME:latest

printf "\nclean tmp...\n\n"
sudo rm -rf ./tmp/*

printf "\ncopy app...\n\n"
for file in $WORKSPACE/*; do
  if [ $file != "$WORKSPACE/docker" ]
    then
      sudo cp -r $file ./tmp/
  fi
done 

printf "\nmount app...\n\n"
sudo docker run --name $APP_NAME -v $(pwd)/tmp:/opt/$APP_NAME node:6 /bin/sh -c "cp -r /opt/$APP_NAME /tmp/"

printf "\ncommit to image...\n\n"
sudo docker commit $APP_NAME $DOCKER_USERNAME/$APP_NAME:latest 

printf "\nremove container...\n\n"
sudo docker rm $APP_NAME

printf "\nrun container...\n\n"
sudo docker run --name $APP_NAME -d --rm $DOCKER_USERNAME/$APP_NAME:latest /bin/sh -c "mv /tmp/$APP_NAME /opt/;node /opt/$APP_NAME/$MAIN_JS"

printf "\ncommit to image again...\n\n"
sudo docker commit $APP_NAME $DOCKER_USERNAME/$APP_NAME:latest 

printf "\nstop container...\n\n"
sudo docker stop $APP_NAME

printf "\nlogin docker...\n\n"
sudo docker login --username=$DOCKER_USERNAME --password=$DOCKER_PASSWORD

printf "\npush image...\n\n"
sudo docker push $DOCKER_USERNAME/$APP_NAME:latest

# verify example
# sudo docker run --name c1 -it --rm -p 9001:8080 kyle11235/node bash
# sudo docker run --name c1 -d --rm -p 9001:8080 kyle11235/node
# http://ip:9001
# sudo docker stop c1




