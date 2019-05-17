# docker practices

		
	docker run --name app -it --rm -p 9090:8080 kyle11235/employee bash
	docker run --name app -d --rm -p 9090:8080 kyle11235/employee
	docker exec -it app bash
	http://localhost:9001
	docker stop app