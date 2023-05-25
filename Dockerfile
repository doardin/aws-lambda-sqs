FROM localstack/localstack:latest

# ENV AWS_DEFAULT_REGION=us-east-2
# ENV AWS_ACCESS_KEY_ID=aws
# ENV AWS_SECRET_ACCESS_KEY=awskey
# ENV DOCKER_HOST=unix:///var/run/docker.sock
# ENV DATA_DIR=/tmp/localstack/data

# WORKDIR /app

COPY localstack-config.sh ./localstack-config.sh
RUN chmod +x ./localstack-config.sh
# RUN sh ./localstack-config.sh

COPY target/*.jar app.jar