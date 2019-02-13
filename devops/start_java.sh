NAME=java
PORT=8080
INTERNAL_PORT=8080

SHELL_DIR=$(dirname "$BASH_SOURCE")
APP_DIR=$(cd $SHELL_DIR; pwd)

if [ "$(docker ps -aq -f name=$NAME)" ]; then
	# stop and run
	docker stop $NAME && docker rm $NAME && docker run --name $NAME -d -p $PORT:$INTERNAL_PORT -v $APP_DIR:/opt openjdk /bin/sh -c "java -jar /opt/app.jar"
else
	# run
	docker run --name $NAME -d -p $PORT:$INTERNAL_PORT -v $APP_DIR:/opt openjdk /bin/sh -c "java -jar /opt/app.jar"
fi
