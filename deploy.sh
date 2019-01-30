#!/bin/bash
echo ${TRAVIS_JOB_NUMBER}
echo ${TRAVIS_TAG}
VERSION=`grep '"version":' package.json | sed 's/.*: "//' | sed 's/",//'`
echo "tagging ubiq-node with version: " ${VERSION}
echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin devopsdockerreg.azurecr.io
docker tag ubiq-node devopsdockerreg.azurecr.io/ubiq-node:${VERSION}
echo "pushing devopsdockerreg.azurecr.io/ubiq-node:"${VERSION}
docker push devopsdockerreg.azurecr.io/ubiq-node:${VERSION}