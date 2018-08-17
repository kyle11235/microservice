# deploy jar
# e.g. target/employee.jar then your app name is employee

DOCKER_USERNAME=kyle11235
DOCKER_PASSWORD=xxx
APP_NAME=employee
WORKSPACE=$(readlink -f ../../)

printf "\nremove image...\n\n"
sudo docker rmi $DOCKER_USERNAME/$APP_NAME:latest

printf "\nclean tmp...\n\n"
sudo rm -rf ./tmp/
sudo mkdir ./tmp

printf "\ncopy app...\n\n"
sudo cp -r $WORKSPACE/target/$APP_NAME.jar ./tmp/

printf "\nmount app...\n\n"
sudo docker run --name $APP_NAME -v $(pwd)/tmp:/opt openjdk /bin/sh -c "cp -r /opt/$APP_NAME.jar /tmp/$APP_NAME.jar"

printf "\ncommit to image...\n\n"
sudo docker commit $APP_NAME $DOCKER_USERNAME/$APP_NAME:latest 

printf "\nremove container...\n\n"
sudo docker rm $APP_NAME

printf "\nrun container...\n\n"
sudo docker run --name $APP_NAME -d --rm $DOCKER_USERNAME/$APP_NAME:latest /bin/sh -c "mv /tmp/$APP_NAME.jar /opt/$APP_NAME.jar;java -jar /opt/$APP_NAME.jar"

printf "\ncommit to image again...\n\n"
sudo docker commit $APP_NAME $DOCKER_USERNAME/$APP_NAME:latest 

printf "\nstop container...\n\n"
sudo docker stop $APP_NAME

printf "\nlogin docker...\n\n"
sudo docker login --username=$DOCKER_USERNAME --password=$DOCKER_PASSWORD

printf "\npush image...\n\n"
sudo docker push $DOCKER_USERNAME/$APP_NAME:latest

# verify example
# sudo docker run --name c1 -it --rm -p 9001:8080 kyle11235/employee bash
# sudo docker run --name c1 -d --rm -p 9001:8080 kyle11235/employee
# http://ip:9001
# sudo docker stop c1





