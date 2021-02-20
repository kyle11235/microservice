# gitlab

- guide

        https://docs.gitlab.com/

- create registry

        ali -> container rgistry
        docker login --username=kyle11235 registry.cn-shenzhen.aliyuncs.com
        password=xxx

        - configure dockerhub mirror
        ali -> container rgistry -> mirror center -> mirror accelerate -> copy url -> local daemon.json
        "registry-mirrors": ["https://xxx.mirror.aliyuncs.com"],

- install gitlab-ee

        on centos
        by docker (macos not supported officially and mac M1 by docker failed)

        - guide
        https://docs.gitlab.com/omnibus/docker/

        - install
        use ali mirror for faster pull, 8022 for 22

        export GITLAB_HOME=/srv/gitlab
        docker run --detach --hostname gitlab.example.com --publish 443:443 --publish 80:80 --publish 8022:22 --name gitlab --restart always --volume $GITLAB_HOME/config:/etc/gitlab:Z --volume $GITLAB_HOME/logs:/var/log/gitlab:Z --volume $GITLAB_HOME/data:/var/opt/gitlab:Z gitlab/gitlab-ee:latest

        docker logs -f gitlab

        visit http://localhost/
        root/xxx

        - update external url
        https://docs.gitlab.com/omnibus/settings/configuration.html#configuring-the-external-url-for-gitlab
        
        vi /$GITLAB_HOME/config/gitlab.rb
        external_url "http://8.140.116.183/"
        docker restart gitlab

- install gitlab-runner

        on centos
        by binary (mac M1 failed with arm64 binary)

        - guide
        https://docs.gitlab.com/runner/install/linux-manually.html

        - install
        curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64
        chmod +x /usr/local/bin/gitlab-runner
        useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
        gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
        gitlab-runner start

        - register
        https://docs.gitlab.com/runner/register/index.html

        gitlab-runner register
        gitlab url=http://x.x.x.x/
        token=get from http://x.x.x.x:port/admin/runners
        executor=docker

                - shell executor
                Shell is the simplest executor to configure. All required dependencies for your builds need to be installed manually on the same machine that GitLab Runner is installed on.

                - docker executor
                A great option is to use Docker as it allows a clean build environment, with easy dependency management (all dependencies for building the project can be put in the Docker image). The Docker executor allows you to easily create a build environment with dependent services, like MySQL.

- pipeline

        - quick start
        https://docs.gitlab.com/ee/ci/quick_start/README.html

        - GitLab CI/CD pipeline configuration reference
        https://docs.gitlab.com/ee/ci/yaml/

        - examples
        https://docs.gitlab.com/ee/ci/examples/README.html
        https://gitlab.com/gitlab-examples
