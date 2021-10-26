# Container image that runs your code
FROM alpine:3.10

# Copy in UMM-S JSON file
COPY cmr/ .

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

RUN ls -la cmr/*

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]