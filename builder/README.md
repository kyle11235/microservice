
# builder

- add this builder folder to your app folder

    app
    app/index.html or app/index.js(8080) or app/app.jar(8080) or app/app.war
    app/builder

- set variables

    e.g.
    DOCKER=/user/bin/docker
    REGISTRY_HOST=registry.hub.docker.com
    REGISTRY_USER=kyle11235
    REGISTRY_PASS=xxx
    APP_NAME=myapp
    IMAGE=$REGISTRY_HOST/$REGISTRY_USER/$APP_NAME:latest

- build.sh uses Dockerfile

    e.g.
    ./build.sh $DOCKER $REGISTRY_HOST $REGISTRY_USER $REGISTRY_PASS $APP_NAME $IMAGE

- buildByCommit commits container to image

    e.g.
    ./buildByCommit.sh $DOCKER $REGISTRY_HOST $REGISTRY_USER $REGISTRY_PASS $APP_NAME $IMAGE
