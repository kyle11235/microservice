# app is the whole project
# app name has to be lower case

DOCKER_USERNAME=kyle11235
DOCKER_PASSWORD=xxx
APP_NAME=node
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
docker build -t $DOCKER_USERNAME/$APP_NAME:latest .

printf "\nlogin docker...\n\n"
sudo docker login --username=$DOCKER_USERNAME --password=$DOCKER_PASSWORD

printf "\npush image...\n\n"
sudo docker push $DOCKER_USERNAME/$APP_NAME:latest

# verify example
# sudo docker run --name c1 -it --rm -p 9001:8080 kyle11235/node bash
# sudo docker run --name c1 -d --rm -p 9001:8080 kyle11235/node
# http://ip:9001
# sudo docker stop c1




