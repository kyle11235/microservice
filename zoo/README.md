
# zookeeper, docker

    sudo docker-compose -f stack.yml up -d
	
	sudo docker network ls
	
	sudo docker run -it --rm \
	  --link zoo_zoo1_1:zk1 \
	  --net zoo_default\
	  zookeeper zkCli.sh -server zk1

	create /test aaa
	ls /
