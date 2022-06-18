FROM ubuntu:20.04

ARG kubescape-version
ENV KUBESCAPE_VERSION=$kubescape-version
ENV KUBESCAPE_SKIP_UPDATE_CHECK 1

RUN apt-get -qq update && apt-get -qq -y install curl

RUN curl -sL -o /usr/bin/kubescape \
    https://github.com/armosec/kubescape/releases/download/${KUBESCAPE_VERSION}/kubescape-ubuntu-latest

RUN chmod +x /usr/bin/kubescape
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
