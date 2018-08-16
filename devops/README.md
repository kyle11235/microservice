# devops

deploy

    install git/docker/docker compose
    sudo mkdir -p /u02/app && cd /u02/app
    git clone https://github.com/kyle11235/navdrawer
    cd navdrawer && sudo chmod +x *.sh
    ./startup.sh

redeploy

    git checkout -- *.sh
    git pull