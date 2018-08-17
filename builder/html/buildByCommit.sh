# static files is in public folder of project
# your app name has to be lower case

DOCKER_USERNAME=kyle11235
DOCKER_PASSWORD=xxx
APP_NAME=html
WORKSPACE=$(readlink -f ../../)

printf "\nremove image...\n\n"
sudo docker rmi $DOCKER_USERNAME/$APP_NAME:latest

printf "\nclean tmp...\n\n"
sudo rm -rf ./tmp/
sudo mkdir ./tmp

printf "\ncopy app...\n\n"
sudo cp -r $WORKSPACE/public/* ./tmp/

printf "\nmount app...\n\n"
sudo docker run --name $APP_NAME -v $(pwd)/tmp:/usr/share/nginx/html nginx /bin/sh -c "cp -r /usr/share/nginx/html /tmp/"

printf "\ncommit to image...\n\n"
sudo docker commit $APP_NAME $DOCKER_USERNAME/$APP_NAME:latest 

printf "\nremove container...\n\n"
sudo docker rm $APP_NAME

printf "\nrun container...\n\n"
sudo docker run --name $APP_NAME -d --rm $DOCKER_USERNAME/$APP_NAME:latest /bin/sh -c "mv /tmp/html/* /usr/share/nginx/html;nginx -g 'daemon off;'"

printf "\ncommit to image again...\n\n"
sudo docker commit $APP_NAME $DOCKER_USERNAME/$APP_NAME:latest 

printf "\nstop container...\n\n"
sudo docker stop $APP_NAME

printf "\nlogin docker...\n\n"
sudo docker login --username=$DOCKER_USERNAME --password=$DOCKER_PASSWORD

printf "\npush image...\n\n"
sudo docker push $DOCKER_USERNAME/$APP_NAME:latest

# verify example
# sudo docker run --name c1 -it --rm -p 9001:80 kyle11235/html bash
# sudo docker run --name c1 -d --rm -p 9001:80 kyle11235/html
# http://ip:9001
# sudo docker stop c1




