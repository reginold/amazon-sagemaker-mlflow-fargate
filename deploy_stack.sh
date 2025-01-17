#!/usr/bin/env bash

# npm install -g aws-cdk@2.8.0
# python3 -m venv .venv
# source .venv/bin/activate
# pip3 install -r requirements.txt


ACCOUNT_ID=$(aws sts get-caller-identity --query Account | tr -d '"')
AWS_REGION=$(aws configure get region)
cdk bootstrap aws://${ACCOUNT_ID}/${AWS_REGION}
cdk deploy --parameters ProjectName=mlflow --require-approval never

# https://zenn.dev/sprout2000/articles/95b125e3359694
# before that cdk deploy --parameters ProjectName=mlflow --require-approval never , you should install the docker in wsl