# devops

        sudo -i
        yum install -y docker-engine
        systemctl enable docker
        systemctl start docker
        yum install -y git
        git config --global user.email "my email" (for commit)
        git config --global user.name "kyle11235"
        yum install -y maven (install missing lib)
        git clone xxx && cd xxx (cat id_rsa > ~/.ssh/id_rsa for ssh clone)
        ./pull_push.sh or ./reset.sh
        ./deploy.sh
