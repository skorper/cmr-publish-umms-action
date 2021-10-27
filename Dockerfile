# Container image that runs your code
FROM python:3.9.7-alpine

RUN apk add --no-cache bash jq curl

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Get version from pyproject.toml
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
RUN mkdir /podaac-umm-publisher
COPY . .

RUN poetry install 
RUN umms_updater --help

#RUN poetry version | awk '{print $1}'
#RUN echo "GITHUB REF=$GITHUB_REF"

# Install from pip
#pip install -i https://test.pypi.org/simple/ podaac-umm-publisher==0.0.51a0


# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]