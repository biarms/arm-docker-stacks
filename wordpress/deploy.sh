#!/bin/bash
export DOCKER_STACK_ID='wordpress'

check() {
	which docker > /dev/null || (echo "docker utility must be in your path." && exit 1)
	which pwgen > /dev/null || (echo "pwgen utility must be in your path to generate passwords." && exit 2)
}

createSecret() {
	if [ ! -f db_password.txt ] ; then pwgen -1 32 > db_password.txt; fi
	if [ ! -f db_root_password.txt ] ; then pwgen -1 32 > db_root_password.txt; fi
}

deploy() {
    docker stack deploy -c stack.yml ${DOCKER_STACK_ID}
}

undeploy() {
	docker stack rm $(DOCKER_STACK_ID)
	sleep 1
}

info() {
	docker stack ps $(DOCKER_STACK_ID)
}

redeploy() {
    undeploy
    deploy
}


main() {
    set -e
    check
    createSecret
    deploy
}

main