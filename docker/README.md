# docker practices

		
	docker run --name c1 -it --rm -p 9001:8080 kyle11235/employee bash
	docker run --name c1 -d --rm -p 9001:8080 kyle11235/employee
	http://ip:9001
	docker stop c1