name=mynode
port=9302
entry=index.js
internal_port=3000
WORKSPACE=${WORKSPACE:=$PWD} 


if [ "$(sudo docker ps -aq -f name=$name)" ]; then
	# stop and run
	sudo docker stop $name && sudo docker rm $name && sudo docker run --name $name -d -p $port:$internal_port -v $WORKSPACE:/opt/app node:6 /bin/sh -c "node /opt/app/$entry"
else
	# run
	sudo docker run --name $name -d -p $port:$internal_port -v $WORKSPACE/opt/app node:6 /bin/sh -c "node /opt/app/$entry"
fi
