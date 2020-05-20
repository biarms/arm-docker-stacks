SHELL=bash
# NOK on linux: .SHELLFLAGS=-e

DOCKER_STACK_ID=biarms-gitea
DOCKER_STACK_ARGS=--orchestrator=swarm

DB_PASSWD := $(shell pwgen -1 32)

default: deploy

purge: undeploy remove-volumes

check:
	@which docker > /dev/null || (echo "docker utility must be in your path." && exit 1)
	@which pwgen > /dev/null || (echo "pwgen utility must be in your path to generate passwords." && exit 2)

createSecret: check
	if [ ! -f db-password.txt ] ; then \
		echo "${DB_PASSWD}" > db-password.txt; \
		echo "DB_PASSWD=${DB_PASSWD}" > db-password.env; \
	fi

deploy: createSecret
	docker stack $(DOCKER_STACK_ARGS) deploy -c stack.yml $(DOCKER_STACK_ID)

undeploy: check
	docker stack $(DOCKER_STACK_ARGS) rm $(DOCKER_STACK_ID)
	sleep 1

info: check
	docker stack $(DOCKER_STACK_ARGS) ps $(DOCKER_STACK_ID)

redeploy: undeploy deploy

start-db-admin-ui:
	docker service update --replicas 1 biarms-gitea_gitea-db-admin

remove-volumes:
	docker volume rm biarms-gitea_gitea-app-data biarms-gitea_gitea-db-data biarms-gitea_gitea-db-admin-data || true