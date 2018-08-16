# weblogic with employee embedded 

    DOCKER_USERNAME=kyle11235
    APP_NAME=weblogic
    APP_VERSION=12.2.1.2

    // clear
    sudo docker rmi $DOCKER_USERNAME/$APP_NAME:$APP_VERSION

    // run
    sudo docker login container-registry.oracle.com

    sudo docker run --name $APP_NAME -d --rm -p 7001:7001 container-registry.oracle.com/middleware/weblogic:$APP_VERSION

    // configure
    sudo docker logs $APP_NAME   ->   weblogic/8f4918df   ->    weblogic/welcome1

    // commit
    sudo docker commit $APP_NAME $DOCKER_USERNAME/$APP_NAME:$APP_VERSION 

    // verify
    sudo docker stop $APP_NAME

    sudo docker run --name $APP_NAME -d --rm -p 7001:7001 $DOCKER_USERNAME/$APP_NAME:$APP_VERSION

    // push
    sudo docker stop $APP_NAME

    sudo docker login

    sudo docker push $DOCKER_USERNAME/$APP_NAME:$APP_VERSION
