FROM ubuntu:20.04

ENV KUBESCAPE_SKIP_UPDATE_CHECK 1
RUN apt-get update && apt-get install -y curl
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

#ENTRYPOINT [ "kubescape" ]

