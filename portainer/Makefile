SHELL=bash
# NOK on linux: .SHELLFLAGS=-e

DOCKER_STACK_ID=biarms-portainer
DOCKER_STACK_ARGS=--orchestrator=swarm

default: deploy

check:
	@which docker > /dev/null || (echo "docker utility must be in your path." && exit 1)
	@which pwgen > /dev/null || (echo "pwgen utility must be in your path to generate passwords." && exit 2)

createSecret: check
	if [ ! -f portainer-password.txt ] ; then pwgen -1 32 > portainer-password.txt; fi

deploy: createSecret
	# curl -L https://downloads.portainer.io/portainer-agent-stack.yml -o stack.yml
	docker stack $(DOCKER_STACK_ARGS) deploy -c stack.yml $(DOCKER_STACK_ID)

undeploy: check
	docker stack $(DOCKER_STACK_ARGS) rm $(DOCKER_STACK_ID)
	sleep 1

info: check
	docker stack $(DOCKER_STACK_ARGS) ps $(DOCKER_STACK_ID)

redeploy: undeploy deploy
