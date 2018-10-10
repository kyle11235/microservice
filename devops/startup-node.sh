NAME=proxy
PORT=8080
INTERNAL_PORT=8080

SHELL_DIR=$(dirname "$BASH_SOURCE")
APP_DIR=$(cd $SHELL_DIR; pwd)

if [ "$(docker ps -aq -f name=$NAME)" ]; then
	# stop and run
	docker stop $NAME && docker rm $NAME && docker run --name $NAME -d -p $PORT:$INTERNAL_PORT -v $APP_DIR:/opt/app node:6 /bin/sh -c "node /opt/app/index.js"
else
	# run
	docker run --name $NAME -d -p $PORT:$INTERNAL_PORT -v $APP_DIR/opt/app node:6 /bin/sh -c "node /opt/app/index.js"
fi
