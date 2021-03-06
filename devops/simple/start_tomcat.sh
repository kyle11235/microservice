# docker / sudo docker

NAME=tomcat
PORT=8080
INTERNAL_PORT=8080

SHELL_DIR=$(dirname "$BASH_SOURCE")
APP_DIR=$(cd $SHELL_DIR; pwd)

cd $APP_DIR
mvn clean package

if [ "$(docker ps -aq -f name=$NAME)" ]; then
	# stop and run
	docker stop $NAME && docker rm $NAME && docker run --name $NAME -d -p $PORT:$INTERNAL_PORT -v $APP_DIR/target:/usr/local/tomcat/webapps:z tomcat:alpine
else
	# run
	docker run --name $NAME -d -p $PORT:$INTERNAL_PORT -v $APP_DIR/target:/usr/local/tomcat/webapps:z tomcat:alpine
fi
