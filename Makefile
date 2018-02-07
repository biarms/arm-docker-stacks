SHELL=bash
# NOK on linux: .SHELLFLAGS=-e

default: deploy

check:
	@which docker > /dev/null || (echo "docker utility must be in your path." && exit 1)

deploy-wordpress: check
	# docker-compose pull -f stack.yml
	docker pull "${DOCKER_REGISTRY}biarms/mysql:5.5"
	docker pull "${DOCKER_REGISTRY}biarms/wordpress:4.9.2"
	cd wordpress \
	&& docker stack deploy -c stack.yml wordpress \
	&& cd ..

undeploy-wordpress: check
	docker stack rm wordpress

info-wordpress: check
	docker stack ps wordpress

redeploy-wordpress: undeploy-wordpress deploy-wordpress



deploy: deploy-wordpress

redeploy: redeploy-wordpress

undeploy: undeploy-wordpress

info: info-wordpress