

DOCKER=$1
REGISTRY_HOST=$2
REGISTRY_USER=$3
REGISTRY_PASS=$4
APP_NAME=$5
IMAGE=$6


SHELL_DIR=$(dirname "$BASH_SOURCE")
APP_DIR=$(cd $SHELL_DIR/../..; pwd)

printf "\nremove image...\n\n"
$DOCKER rmi $IMAGE

printf "\nclean tmp...\n\n"
rm -rf $SHELL_DIR/tmp
mkdir $SHELL_DIR/tmp

printf "\ncopy app...\n\n"
cp -r $APP_DIR/app.jar $SHELL_DIR/tmp/

printf "\nmount app...\n\n"
$DOCKER run --name $APP_NAME -v $SHELL_DIR/tmp:/opt openjdk /bin/sh -c "cp -r /opt/app.jar /tmp/app.jar"

printf "\ncommit to image...\n\n"
$DOCKER commit $APP_NAME $IMAGE

printf "\nremove container...\n\n"
$DOCKER rm $APP_NAME

printf "\nrun container...\n\n"
$DOCKER run --name $APP_NAME -d --rm $IMAGE /bin/sh -c "mv /tmp/app.jar /opt/app.jar;java -jar /opt/app.jar"

printf "\ncommit to image again...\n\n"
$DOCKER commit $APP_NAME $IMAGE

printf "\nstop container...\n\n"
$DOCKER stop $APP_NAME

printf "\nlogin docker...\n\n"
$DOCKER login --username=$REGISTRY_USER --password=$REGISTRY_PASS $REGISTRY_HOST

printf "\npush image...\n\n"
$DOCKER push $DOCKER_USERNAME/$APP_NAME:latest






