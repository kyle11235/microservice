# devops

        sudo -i
        yum install -y docker-engine
        systemctl enable docker
        systemctl start docker
        yum install -y git
        git config --global user.email "my email" (for commit)
        git config --global user.name "kyle11235"
        yum install -y java-1.8.0-openjdk (if not installed)
        yum install -y maven (install missing lib)
        git clone with ssh (vi ~/.ssh/id_rsa for ssh clone, chmod 400 ~/.ssh/id_rsa)
        ./pull_push.sh or ./reset.sh
        ./deploy.sh
