SHELL=bash
# NOK on linux: .SHELLFLAGS=-e

default: deploy

check:
	@which kubectl > /dev/null || (echo "kubectl utility must be in your path." && exit 1)
	@which pwgen > /dev/null || (echo "pwgen utility must be in your path to generate passwords." && exit 2)

createSecret: check
	if [ ! -f db-password.txt ] ; then pwgen -1 32 > db-password.txt; fi
	if [ ! -f db-root-password.txt ] ; then pwgen -1 32 > db-root-password.txt; fi

deploy: createSecret
	kubectl create secret generic db-passwords --from-file=./db-password.txt --from-file=./db-root-password.txt
	kubectl apply -f .

undeploy: check
	kubectl delete -f . || true
	kubectl delete secret db-passwords || true

info: check
	kubectl get services

redeploy: undeploy deploy
