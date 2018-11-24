build:
	mkdir boinc
	-docker rmi firedoc
	make -C client
	make -C server
	docker build -t firedoc:latest .

run:
	-docker rm firedoc
	docker run -p 8080:8080 -p 8081:8081 -it --name firedoc -v $(shell pwd):/data firedoc:latest "/data/boinccmd/start.sh"

first_start:
	-docker rm firedoc
	docker run -p 8080:8080 -p 8081:8081 -it --name firedoc -v $(shell pwd):/data firedoc:latest "/data/boinccmd/first_start.sh"

