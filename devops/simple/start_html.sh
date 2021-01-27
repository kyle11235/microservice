# docker / sudo docker

NAME=html
PORT=8080
INTERNAL_PORT=80

SHELL_DIR=$(dirname "$BASH_SOURCE")
APP_DIR=$(cd $SHELL_DIR; pwd)

if [ "$(docker ps -aq -f name=$NAME)" ]; then
	# stop and run
	docker stop $NAME && docker rm $NAME && docker run --name $NAME -d -p $PORT:$INTERNAL_PORT -v $APP_DIR:/usr/share/nginx/html:z nginx:1.17
else
	# run
	docker run --name $NAME -d -p $PORT:$INTERNAL_PORT -v $APP_DIR:/usr/share/nginx/html:z nginx:1.17
fi
