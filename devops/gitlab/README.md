# gitlab

- create registry

        ali -> container rgistry
        docker login --username=kyle11235 registry.cn-shenzhen.aliyuncs.com
        password=mydocker001

        - configure dockerhub mirror
        ali -> container rgistry -> mirror center -> mirror accelerate -> copy url -> local daemon.json
        "registry-mirrors": ["https://xxx.mirror.aliyuncs.com"],

- install gitlab-ce

        docker run --detach --hostname mygitlab.com --publish 443:443 --publish 80:80 --publish 22:22 --name gitlab --volume /u02/app/gitlab/config:/etc/gitlab --volume /u02/app/gitlab/logs:/var/log/gitlab --volume /u02/app/gitlab/data:/var/opt/gitlab gitlab/gitlab-ce:latest

        visit http://localhost/
        root/mygitlab001

        - error
        502 error
        
        cpu is high
        CONTAINER ID   NAME      CPU %     MEM USAGE / LIMIT     MEM %     NET I/O           BLOCK I/O         PIDS
        61600954239f   gitlab    200%    1.678GiB / 1.944GiB   86.30%    29.1kB / 64.2kB   50.8GB / 2.86MB   266

- install gitlab-runner

        - install
        docker run -d --name gitlab-runner --restart always --link gitlab -v /u02/app/gitlab-runner/config:/etc/gitlab-runner -v /var/run/docker.sock:/var/run/docker.sock gitlab/gitlab-runner:latest

        - register
        docker exec -it gitlab-runner gitlab-runner register
        
        gitlab url=http://${container_name}
        e.g.
        http://gitlab

        token=get from http://localhost:81/admin/runners

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
