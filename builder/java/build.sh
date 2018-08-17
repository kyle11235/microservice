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
docker build -t $DOCKER_USERNAME/$APP_NAME:latest .

printf "\nlogin docker...\n\n"
sudo docker login --username=$DOCKER_USERNAME --password=$DOCKER_PASSWORD

printf "\npush image...\n\n"
sudo docker push $DOCKER_USERNAME/$APP_NAME:latest

# verify example
# sudo docker run --name c1 -it --rm -p 9001:8080 kyle11235/employee bash
# sudo docker run --name c1 -d --rm -p 9001:8080 kyle11235/employee
# http://ip:9001
# sudo docker stop c1





