# weblogic with employee embedded

    DOCKER_USERNAME=kyle11235
    APP_NAME=weblogic
    APP_VERSION=12.2.1.2

    // clear
    docker rmi $DOCKER_USERNAME/$APP_NAME:$APP_VERSION

    // run
    docker login container-registry.oracle.com

    docker run --name $APP_NAME -d --rm -p 7001:7001 container-registry.oracle.com/middleware/weblogic:$APP_VERSION

    // configure
    docker logs $APP_NAME   ->   weblogic/8f4918df   ->    weblogic/welcome1

    // commit
    docker commit $APP_NAME $DOCKER_USERNAME/$APP_NAME:$APP_VERSION 

    // verify
    docker stop $APP_NAME

    docker run --name $APP_NAME -d --rm -p 7001:7001 $DOCKER_USERNAME/$APP_NAME:$APP_VERSION

    // push
    docker stop $APP_NAME

    docker login

    docker push $DOCKER_USERNAME/$APP_NAME:$APP_VERSION
