#!/bin/bash
terraform output -raw docker-credentials > ~/.docker/config.json
registry=$(terraform output -raw docker-container-registry)
docker login $registry