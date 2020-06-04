# https://hub.docker.com/r/google/cloud-sdk/
FROM google/cloud-sdk:latest

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
