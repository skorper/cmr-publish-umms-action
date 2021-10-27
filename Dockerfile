# Container image that runs your code
FROM python:3.9.7-alpine

RUN apk add --no-cache bash jq

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Download this repo from pip
COPY . /
RUN pip install /
# Verify installation
RUN umms_updater --help

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]