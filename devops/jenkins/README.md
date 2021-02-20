# jenkins

- install

        - guide
        https://jenkins.io/doc/book/installing/

        - download
        https://get.jenkins.io/war/2.275/jenkins.war
        /u02/app/jenkins/jenkins.war

        - run
        run.sh (echo "java -jar jenkins.war --httpPort=9001" > run.sh && chmod +x run.sh)
        or
        nohup java -jar jenkins.war --httpPort=9001 > out.log &

        60630c48314c438bbd292ba9b1a56407 -> This may also be found at: /Users/kyle/.jenkins/secrets/initialAdminPassword
        jenkins home = /Users/kyle/.jenkins

        - visit
        http://localhost:9001/
        admin/xxx

                - fix
                error = Please wait while Jenkins is getting ready to work ...
                vi /Users/kyle/.jenkins/hudson.model.UpdateCenter.xml
                https://updates.jenkins.io/update-center.json -> https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/update-center.json
                restart

- reset password

        vi ~/.jenkins/users/admin.../config.xml -> 
        jbcrypt:$2a$10$4NW.9hNVyltZlHzrNOOjlOgfGrGUkZEpBfhkaUrb7ODQKBVmKRcmK = 123456

- jenkins pipeline

        https://www.jenkins.io/doc/book/pipeline/

        - steps generator
        http://localhost:9001/job/guide-jira-example/pipeline-syntax/