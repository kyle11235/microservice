
internal data volume

	sudo docker run --name mysql -d -p 3306:3306 -v /u02/app/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=test mysql --character-set-server=utf8 --collation-server=utf8_general_ci
	
external data volume

	sudo docker run --name mysql -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=test mysql --character-set-server=utf8 --collation-server=utf8_general_ci
		
mysql 8:
	docker exec -it mysql bash
	ALTER USER 'root' IDENTIFIED WITH mysql_native_password BY 'root';

mysql 5.5.45:
	echo lower_case_table_names=1 >> /etc/mysql/my.cnf and restart