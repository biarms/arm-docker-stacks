#!/usr/bin/env bash

kubectl scale -n default deployment wordpress --replicas=0
kubectl scale -n default deployment wordpress-db --replicas=0