FROM ubuntu:20.04
ARG ksversion
ENV KUBESCAPE_SKIP_UPDATE_CHECK 1
RUN apt-get update && apt-get install -y curl
RUN echo "https://github.com/armosec/kubescape/releases/download/${ksversion}/kubescape-ubuntu-latest"
RUN curl -sL -o /usr/bin/kubescape \
    https://github.com/armosec/kubescape/releases/download/${ksversion}/kubescape-ubuntu-latest
RUN chmod +x /usr/bin/kubescape
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

#ENTRYPOINT [ "kubescape" ]

