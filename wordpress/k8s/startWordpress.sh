#!/usr/bin/env bash

kubectl scale deployment wordpress --replicas=2
kubectl scale deployment wordpress-db --replicas=1