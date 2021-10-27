# Container image that runs your code
FROM alpine:3.10

RUN apk add --no-cache bash jq

RUN ls -la .
RUN ls -la $GITHUB_WORKSPACE

# Copy in UMM-S JSON file
COPY cmr/ /cmr/

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Copy in Python dist TODO how to install python lib in the container?!?!?!
#COPY ...

RUN ls -la .
RUN ls -la cmr/

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]