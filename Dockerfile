# https://hub.docker.com/r/google/cloud-sdk/
FROM google/cloud-sdk:293.0.0-alpine

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
