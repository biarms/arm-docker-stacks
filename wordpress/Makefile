SHELL=bash
# NOK on linux: .SHELLFLAGS=-e

DOCKER_STACK_ID=biarms-wordpress
DOCKER_STACK_ARGS=--orchestrator=swarm

default: deploy

check:
	@which docker > /dev/null || (echo "docker utility must be in your path." && exit 1)
	@which pwgen > /dev/null || (echo "pwgen utility must be in your path to generate passwords." && exit 2)

createSecret: check
	if [ ! -f db-password.txt ] ; then pwgen -1 32 > db-password.txt; fi
	if [ ! -f db-root-password.txt ] ; then pwgen -1 32 > db-root-password.txt; fi

deploy: createSecret
	docker stack $(DOCKER_STACK_ARGS) deploy -c stack.yml $(DOCKER_STACK_ID)

undeploy: check
	docker stack $(DOCKER_STACK_ARGS) rm $(DOCKER_STACK_ID)
	sleep 1

info: check
	docker stack $(DOCKER_STACK_ARGS) ps $(DOCKER_STACK_ID)

redeploy: undeploy deploy
