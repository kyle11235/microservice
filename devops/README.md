# devops

deploy

    place startup.sh into source code
    install git/docker
    git clone xxx
    cd xxx && build app
    chmod +x *.sh
    ./startup.sh

redeploy

    git checkout -- *.sh
    git pull