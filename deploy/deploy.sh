#!/bin/sh

./ecs-deploy --cluster circleci-go-test --service-name circleci-go-test --image $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$ECR_REPOSITORY_NAME:$CIRCLE_SHA1