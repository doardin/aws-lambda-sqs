#!/bin/bash
queue_name="sqs-lambda-function"
application_name="app.jar"
application_lambda_handler_path="br.com.doardin.Handler::handleRequest"
application_java_version="java11"

echo "Starting environment configuration..."

echo "Creating IAM role"
aws --endpoint http://localhost:4566 iam create-role --role-name sqs-lambda-function --assume-role-policy-document "{\"Version\": \"2012-10-17\",\"Statement\": [{ \"Effect\": \"Allow\", \"Principal\": {\"Service\": \"lambda.amazonaws.com\"}, \"Action\": \"sts:AssumeRole\"}]}"

echo "Attaching role police to iam role"
aws --endpoint http://localhost:4566 iam attach-role-policy --role-name sqs-lambda-function --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRol

echo "Creating SQS queue sqs-lambda-function"
aws --endpoint http://localhost:4566 sqs create-queue --queue-name sqs-lambda-function

echo "Creating Lambda function"
aws --endpoint http://localhost:4566 lambda create-function --function-name sqs-lambda-function --zip-file fileb://$application_name --memory-size=1024 --handler $application_lambda_handler_path --runtime $application_java_version --role arn:aws:iam::000000000000:role/sqs-lambda-function

echo "Environment configuration finished"