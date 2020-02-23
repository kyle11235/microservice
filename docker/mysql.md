
# mysql

- external data volume/easy to locate/notice :z

        - mysql5
        sudo docker run --name mysql5 -d -p 3306:3306 -v /u02/app/mysql5:/var/lib/mysql:z -e MYSQL_ROOT_PASSWORD=mypassword -e MYSQL_DATABASE=mydb mysql:5.6.45 --character-set-server=utf8 --collation-server=utf8_general_ci

        - mysql8
        sudo docker run --name mysql -d -p 3306:3306 -v /u02/app/mysql:/var/lib/mysql:z -e MYSQL_ROOT_PASSWORD=mypassword -e MYSQL_DATABASE=mydb mysql:8 --character-set-server=utf8 --collation-server=utf8_general_ci

- internal data volume

        sudo docker run --name mysql -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=mypassword -e MYSQL_DATABASE=mydb mysql:8 --character-set-server=utf8 --collation-server=utf8_general_ci

- connection issue

        - mysql:5.6.45
        echo lower_case_table_names=1 >> /etc/mysql/my.cnf and restart
        
        - mysql:8
        docker exec -it mysql bash
        mysql -u root -p mydb
        ALTER USER 'root' IDENTIFIED WITH mysql_native_password BY 'mypassword';
        exit
    
- document

        https://hub.docker.com/_/mysql
    
- create schema

        drop database if exists mydb1;
        create database mydb1 default character set utf8mb4 collate utf8mb4_unicode_ci;
        use mydb1;

- create user

        change % to host name for production deployment
        drop user if exists 'user1'@'%';
        create user 'user1'@'%' IDENTIFIED WITH mysql_native_password by 'mypassword';
        grant all privileges on mydb1.* to 'user1'@'%';
        flush privileges;
       
- check all users

        select user, host FROM mysql.user;

