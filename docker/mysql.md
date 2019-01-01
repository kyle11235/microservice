
persist data

	sudo docker run --name mysql -d -p 3306:3306 -v /u02/app/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=test mysql --character-set-server=utf8 --collation-server=utf8_general_ci
	
no persistent data

	sudo docker run --name mysql -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=test mysql --character-set-server=utf8 --collation-server=utf8_general_ci
		

mysql8:
	docker exec -it mysql bash
	ALTER USER 'root' IDENTIFIED WITH mysql_native_password BY 'root';