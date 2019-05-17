# oracle db

    DOCKER_USERNAME=kyle11235
    APP_NAME=oracle
    APP_VERSION=12.2.0.1

    // clear
    sudo docker rmi $DOCKER_USERNAME/$APP_NAME:$APP_VERSION

    // run
    sudo docker login container-registry.oracle.com

    sudo docker run --name $APP_NAME -d -it --rm -p 1521:1521 container-registry.oracle.com/database/enterprise:$APP_VERSION

    // configure
    sys/Oradoc_db1
    DB_SID:ORCLCDB
    DB_PDB:ORCLPDB1

    // commit
    sudo docker commit $APP_NAME $DOCKER_USERNAME/$APP_NAME:$APP_VERSION 

    // verify
    sudo docker stop $APP_NAME

    sudo docker run --name $APP_NAME -d -it --rm -p 1521:1521 $DOCKER_USERNAME/$APP_NAME:$APP_VERSION

    // push
    sudo docker stop $APP_NAME

    sudo docker login

    sudo docker push $DOCKER_USERNAME/$APP_NAME:$APP_VERSION
