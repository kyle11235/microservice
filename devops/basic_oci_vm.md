# basic oci vm

        1.wget
        yum install wget

        2.jdk
        wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz

        3.git
        sudo yum upgrade
        sudo yum install git

        4.docker
        wget https://download.docker.com/linux/static/stable/x86_64/docker-18.03.0-ce.tgz
        tar -zxvf docker-18.03.0-ce.tgz
        sudo cp docker/* /usr/bin/
        sudo dockerd &
        sudo docker run hello-world

        5.jenkins
        wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
        nohup java -jar jenkins.war --httpPort=9001 > out.log &

        http://x.x.x.x:9001/
        9d5a084cc16045b78b5c51ec16ab1ef4

        6.security rule -> All

        7.firewall
        sudo firewall-cmd --zone=public --permanent --add-port=9001/tcp
        sudo firewall-cmd --reload
