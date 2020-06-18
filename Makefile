SHELL=sh
# NOK on linux: .SHELLFLAGS=-e

default: deploy

check:
	@which docker > /dev/null || (echo "docker utility must be in your path." && exit 1)

deploy-portainer: check
	cd portainer && make deploy

undeploy-portainer: check
	cd portainer && make undeploy

deploy-wordpress: check
	cd wordpress && make deploy

undeploy-wordpress: check
	cd wordpress && make undeploy

deploy-gogs: check
	cd gogs && make deploy

undeploy-gogs: check
	cd gogs && make undeploy

deploy-gitea: check
	cd gitea && make deploy

undeploy-gitea: check
	cd gitea && make undeploy

deploy: deploy-portainer deploy-wordpress deploy-gitea

undeploy: undeploy-gitea undeploy-wordpress undeploy-portainer
