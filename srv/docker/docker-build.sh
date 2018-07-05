#!/bin/sh

echo "Building Dockerfile for $ENV environment"

if   [ "$CI_COMMIT_REF_NAME" = "dev" ];  then
    docker pull $DOCKER_REG_HOST/$CI_PROJECT_PATH/$SERVICE_NAME:latest || true
    docker build -t $SERVICE_NAME .
    docker tag $SERVICE_NAME:latest $DOCKER_REG_HOST/$CI_PROJECT_PATH/$SERVICE_NAME:latest
    docker push $DOCKER_REG_HOST/$CI_PROJECT_PATH/$SERVICE_NAME:latest
elif [ "$CI_COMMIT_REF_NAME" = "master" ] || [ "$CI_COMMIT_REF_NAME" = "stable" ]; then
    docker pull $DOCKER_REG_HOST/$CI_PROJECT_PATH/$SERVICE_NAME:$SERVICE_VERSION || true
    docker build -t $SERVICE_NAME .
    docker tag $SERVICE_NAME:latest $DOCKER_REG_HOST/$CI_PROJECT_PATH/$SERVICE_NAME:$SERVICE_VERSION
    docker push $DOCKER_REG_HOST/$CI_PROJECT_PATH/$SERVICE_NAME:$SERVICE_VERSION
else
    echo "A required variable is incorrect or not defined. Please check Gitlab CI's pipeline file."
fi