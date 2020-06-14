SHELL=bash

default: deploy

check:
	@which docker > /dev/null || (echo "docker utility must be in your path." && exit 1)
	@which docker-compose > /dev/null || (echo "docker-compose utility must be in your path." && exit 1)

deploy: check
	docker-compose up -d

undeploy: check
	docker-compose down
	sleep 1

info: check
	docker-compose ps

redeploy: undeploy deploy
