SHELL=bash
# NOK on linux: .SHELLFLAGS=-e

default: deploy

check:
	@which kubectl > /dev/null || (echo "kubectl utility must be in your path." && exit 1)
	@which pwgen > /dev/null || (echo "pwgen utility must be in your path to generate passwords." && exit 2)

createSecret: check
	if [ ! -f db-password-root ] ; then pwgen -1 64 > db-password-root; fi
	if [ ! -f db-password-wordpress ] ; then pwgen -1 32 > db-password-wordpress; fi

deploy: createSecret
	kubectl create secret generic wordpress-db-passwords --from-file=./db-password-root --from-file=./db-password-wordpress
	kubectl apply -f .

undeploy: check
	kubectl delete -f . || true
	kubectl delete secret wordpress-db-passwords || true

info: check
	kubectl get services

redeploy: undeploy deploy
