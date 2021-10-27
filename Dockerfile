# Container image that runs your code
FROM alpine:3.10

RUN apk add --no-cache bash jq

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Download this repo from pip
# echo version
RUN env
#RUN pip install podaac-umm-publisher-action==$VERSION

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]