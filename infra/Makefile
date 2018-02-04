SHELL=bash
.SHELLFLAGS=-e
DOCKER_STACK_ID=biarms-infra

default: deploy

check:
	@which docker > /dev/null || (echo "docker utility must be in your path." && exit 1)

deploy: check
	docker stack deploy -c stack.yml $(DOCKER_STACK_ID)

undeploy: check
	docker stack rm $(DOCKER_STACK_ID)
	sleep 1

info: check
	docker stack ps $(DOCKER_STACK_ID)

redeploy: undeploy deploy
