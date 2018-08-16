name=cloudservice-1.0.0
port=9102
WORKSPACE=${WORKSPACE:=$PWD} 

if [ "$(sudo docker ps -aq -f name=$name)" ]; then
	# stop and run
	sudo docker stop $name && sudo docker rm $name && sudo docker run --name $name -d -p $port:8080 -v $WORKSPACE/target:/opt openjdk /bin/sh -c "java -jar /opt/$name.jar"
else
	# run
	sudo docker run --name $name -d -p $port:8080 -v $WORKSPACE/target:/opt openjdk /bin/sh -c "java -jar /opt/$name.jar"
fi
