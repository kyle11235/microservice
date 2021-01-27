# docker / sudo docker
# requires ./data

NAME=mysql
PORT=3306
INTERNAL_PORT=3306
MYSQL_ROOT_PASSWORD=mypassword
MYSQL_DATABASE=mydb

SHELL_DIR=$(dirname "$BASH_SOURCE")
APP_DIR=$(cd $SHELL_DIR; pwd)

# no need to retart
if [ "$(docker ps -aq -f name=$NAME)" ]; then
	echo "mysql is running"
else
	# run
	docker run --name $NAME -d -p $PORT:$INTERNAL_PORT -v $APP_DIR:/var/lib/mysql:z -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD -e MYSQL_DATABASE=$MYSQL_DATABASE mysql:8 --character-set-server=utf8 --collation-server=utf8_general_ci
fi

