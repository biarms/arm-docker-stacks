#!/bin/bash
export DOCKER_STACK_ID='biarms-infra'

check() {
	which docker > /dev/null || (echo "docker utility must be in your path." && exit 1)
}

deploy() {
    docker stack deploy -c stack.yml ${DOCKER_STACK_ID}
}

main() {
    set -e
    check
    deploy
}

main