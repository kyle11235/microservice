# docker

- install

        - oracle linux6 (outdatd, only docker EE + oracle linux 7 available)
        virtualbox NAT, if cannot resolve yum.oracle.com -> ensure internet
        
        if behind proxy
            if oracle linux6 -> /etc/sysconfig/docker
            else if other Linux -> https://docs.docker.com/engine/admin/systemd/#http-proxy
        
        su

        tee /etc/yum.repos.d/docker.repo <<-EOF
        [dockerrepo]
        name=Docker Repository
        baseurl=https://yum.dockerproject.org/repo/main/oraclelinux/6
        enabled=1
        gpgcheck=1
        gpgkey=https://yum.dockerproject.org/gpg

        EOF

        yum install docker-engine
        service docker start
        docker run hello-world

        - oracle linux7 oci
        yum install -y docker-engine

        systemctl enable docker (run as a system service) 
        systemctl start docker
        or 
        service docker start

        - centos7.6 ali ecs
        yum install -y yum-utils \
        device-mapper-persistent-data \
        lvm2

        yum-config-manager \
            --add-repo \
            https://download.docker.com/linux/centos/docker-ce.repo

        yum install docker-ce docker-ce-cli containerd.io
        systemctl start docker
        docker run hello-world

        - debian oci
        bitnami -> username is opc, can also be bitnami
        
        reset password
        check https://docs.bitnami.com/oracle/faq/#using-the-oracle-cloud-platform-console
        or check https://gist.github.com/gmhawash/4043232
        cd /opt/bitnami/apps/jenkins/jenkins_home/users/user
        sudo vi config.xml
        update passwordHash to 'test' -> #jbcrypt:$2a$10$razd3L1aXndFfBNHO95aj.IVrFydsxkcQCcLmujmFQzll3hcUrY7S
        sudo /etc/init.d/bitnami restart
        login and change it

        sudo apt-get update
        sudo apt-get install \
            apt-transport-https \
            ca-certificates \
            curl \
            gnupg2 \
            software-properties-common


        sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
        $(lsb_release -cs) \
        stable"

        sudo apt-get update
        sudo apt-get install docker-ce
        sudo docker run hello-world

        pwd -> /var/lib/docker

        - ubuntu oci
        https://docs.docker.com/install/linux/docker-ce/ubuntu/

        oci ubuntu 17.04 not accessible at all
        oci ubuntu 14.04 public key is not added into server
        oci ubuntu 16.04.3 works (username is ubuntu, opc won't work)

        sudo apt-get update
        sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common

        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

        sudo apt-key fingerprint 0EBFCD88

        sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"

        sudo apt-get update
        sudo apt-get install docker-ce
        sudo docker run hello-world

        - binary
        https://docs.docker.com/install/linux/docker-ce/binaries/#install-static-binaries

        sudo -i (if it’s mac install docker and all other tools to /usr/local/bin because docker can be started there)
        wget https://download.docker.com/linux/static/stable/x86_64/docker-18.03.0-ce.tgz
        tar -zxvf docker-18.03.0-ce.tgz
        cp docker/* /usr/bin/ (/user/bin is in PATH, so dockerd can be found) 
        dockerd &
        docker run hello-world
        if stopped -> dockerd &

        - mac
        https://docs.docker.com/v17.12/docker-for-mac/install/#download-docker-for-mac

- basic

        - status (oci)
        service docker status
        docker ps -a

        - run
        docker run hello-world

        - run in interactive mode
        docker run -it ubuntu
        exit

        - runn with non-default command and params
        docker run ubuntu /bin/echo 'Hello world'
        docker run -it ubuntu bash
        docker run -it ubuntu /bin/bash

        - run in background instead of exiting immediately
        a container needs the the last command not exit, or the container will exit.
        below is very useful, you can execute any sh
        /bin/sh is a specification, can be pointing to any implemented bash, lile /bin/bash
        /bin/sh -c reads commands from a string
        e.g. docker run -d ubuntu /bin/sh -c "while true; do echo hello world; sleep 1; done"

        - run ubuntu in background without while code
        docker run -itd ubuntu

        - run with auto port
        docker run -d -P --name c2 training/webapp python app.py
        check port -> docker ps

        - stop/restart
        docker stop c1
        docker start c1

        - stop/remove all containers
        docker stop $(docker ps -a -q)     
        docker rm $(docker ps -a -q)

        - check log
        docker logs c1
        docker logs -f c1

        - inspect config
        docker inspect c1

        - run my app (--rm delete after stop)
        docker run --name app -it --rm -p 9090:8080 kyle11235/employee bash
        docker run --name app -d --rm -p 9090:8080 kyle11235/employee
        docker exec -it app bash
        http://localhost:9090
        docker stop app

        - run tomcat
        https://hub.docker.com/_/tomcat/
        docker run -it --rm -p 8888:8080 tomcat:8.0
        docker run -it --rm -p 8888:8080 tomcat:alpine

        /opt/test/test.war
        docker run -d --name c4 -p 8888:8080 -v /opt/test:/usr/local/tomcat/webapps tomcat
        docker logs -f c4
        
- image

        - build by docker file
        mkdir -p /u01/mydockerbuild
        cd /u01/mydockerbuild
        touch Dockerfile
        vi Dockerfile

        FROM docker/whalesay:latest
        RUN apt-get -y update && apt-get install -y fortunes
        CMD /usr/games/fortune -a | cowsay

        docker build -t mywhalesay .
        docker run mywhalesay

        - save/load image offline
        sudo docker save -o ubuntu_image.docker ubuntu
        sudo docker load < ubuntu_image.docker

        - login
        docker login --username=kyle11235

        - tag
        docker tag image_id(hash) kyle11235/whalesay:latest

        - pull
        docker pull kyle11235/whalesay
        docker pull ubuntu
        docker pull centos
        docker pull training/sinatra

        - push
        docker push kyle11235/whalesay

        - remove
        docker rmi mywhalesay

        - check size
        du -h --max-depth=1 /var/lib/docker

        - build by commit
        docker run -it ubuntu bash

        apt-get install software-properties-common
        add-apt-repository ppa:webupd8team/java
        apt-get update
        apt-get install oracle-java8-installer
        which java

        groupadd tomcat
        useradd -s /bin/false -g tomcat -d /u01/app/tomcat tomcat
        cd ~
        wget http://download.nus.edu.sg/mirror/apache/tomcat/tomcat-8/v8.5.6/bin/apache-tomcat-8.5.6.tar.gz
        mkdir -p /u01/app/tomcat
        tar xvf apache-tomcat-8*tar.gz -C /u01/app/tomcat --strip-components=1
        cd /u01/app/
        chown -R tomcat:tomcat tomcat 

        apt-get install vim
        vi /u01/app/tomcat/conf/tomcat-users.xml
        <role rolename="manager-gui"/>
        <user username="tomcat" password="tomcat" roles="manager-gui"/>

        exit
        docker ps -a

        docker commit -m "add tomcat" -a "kyle" nostalgic_ritchie  kyle11235/tomcat:latest

        if modify
        docker run -it --name mytomcat kyle11235/tomcat
        exit
        docker ps -l
        docker commit -m "Added tomcat" -a "Kyle Zhang" mytomcat kyle11235/tomcat:latest

        set start command by docker file
        mkdir -p /u01/mydocker/mytomcat
        cd /u01/mydocker/mytomcat
        touch Dockerfile
        vi Dockerfile

        FROM kyle11235/tomcat
        CMD /u01/app/tomcat/bin/startup.sh && tail -F /u01/app/tomcat/logs/catalina.out

        cat Dockerfile
        docker build -t kyle11235/tomcat:latest .

        docker run -idp 8080:8080 --name mytomcat  kyle11235/tomcat

- docker file

        https://docs.docker.com/engine/reference/builder/

        FROM node:6
        EXPOSE 8080
        COPY tmp ./myapp
        CMD node ./myapp/8080.js

        docker build -t kyle11235/node:latest .

- docker compose

        - install
        https://docs.docker.com/compose/install/
        curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/bin/docker-compose
        sudo chmod +x /usr/bin/docker-compose
        docker-compose -v

        - uninstall
        rm /usr/bin/docker-compose

        - start
        docker-compose up -d

        - stop
        docker-compose stop

- data

        - docker
            https://docs.docker.com/engine/admin/volumes/volumes/
            
            - volume (docker managed directory)
            e.g.
            sudo docker run --rm -it -v my-vo:/usr/share/nginx/html nginx bash
            /var/lib/docker/volumes/my-vol/_data

            - bind mount (host directory)
            e.g.
            sudo docker run --rm -it -v /opt/tmp:/usr/share/nginx/html nginx bash
            content of target point will be hidden untill host dir is unmounted

            - tmpfs mount (host memory)

        - mysql
            https://hub.docker.com/_/mysql/
            - write data file to host directioy
            - write data file to a docker volume

        - redis
            random volume is created every time -> sudo docker volume list

            run with persistence storage enabled
            sudo docker run --name some-redis -d redis redis-server --appendonly yes

            - use the random volume
            - --volumes-from some-volume-container
            - -v /docker/host/dir:/data

- writable layer

        https://docs.docker.com/engine/userguide/storagedriver/imagesandcontainers/
        image is built up from a series of layers. Each layer represents an instruction in the image’s Dockerfile.

        e.g.
        FROM ubuntu:15.04
        COPY . /app
        RUN make /app
        CMD python /app/app.py

        if you run from this image, 4 locked layers for image + 1 layer for the container
        image is stored by layers, you can see them when you docker pull some image
        they share underlying layers cannot delete a image when you have running/stopped containers/local images built on this image

        sudo docker history image_id
        layers are stored in /var/lib/docker/<storage-driver>/layers/

- selinux

        If you use selinux you can add the z or Z options highlighted in yellow
        z: means shared with other containers
        Z: means private to this container
        docker run --name adwapp -d -p 8080:8080 -v /home/opc/config:/root/.adw:z kyle11235/adwapp

- registry

        - ali mirror, centos
        https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors
        
        vi /etc/docker/daemon.json
        "registry-mirrors": ["https://xxx.mirror.aliyuncs.com"]
        systemctl daemon-reload
        systemctl restart docker

