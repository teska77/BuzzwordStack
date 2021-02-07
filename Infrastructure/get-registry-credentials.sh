#!/bin/bash
docker logout
terraform output -raw docker-credentials > ~/.docker/config.json
registry=$(terraform output -raw docker-container-registry)
docker login $registry
mkdir -p ~/.kube
terraform output -raw kubeconfig > ~/.kube/config
