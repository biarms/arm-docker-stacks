SHELL=bash
# NOK on linux: .SHELLFLAGS=-e

DOCKER_STACK_ID=biarms-gogs

default: deploy

check:
	@which docker > /dev/null || (echo "docker utility must be in your path." && exit 1)
	@which pwgen > /dev/null || (echo "pwgen utility must be in your path to generate passwords." && exit 2)

createSecret: check
	if [ ! -f db-password.txt ] ; then pwgen -1 32 > db-password.txt; fi

deploy: createSecret
	docker stack deploy -c stack.yml $(DOCKER_STACK_ID)

undeploy: check
	docker stack rm $(DOCKER_STACK_ID)
	sleep 1

info: check
	docker stack ps $(DOCKER_STACK_ID)

redeploy: undeploy deploy