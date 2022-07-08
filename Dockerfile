FROM ubuntu:20.04

ARG KUBECONFIG_CONTENT
ENV kubeconfig_content=$KUBECONFIG_CONTENT

RUN echo $kubeconfig_content

RUN mkdir .kube
RUN echo "$kubeconfig_content" > /.kube/config

RUN export KUBECONFIG=/.kube/config

RUN ls -a /
RUN ls -a /.kube

RUN ls -a /.kube/config
RUN cat /.kube/config

ENV KUBESCAPE_SKIP_UPDATE_CHECK 1
RUN apt-get update && apt-get install -y curl
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

#ENTRYPOINT [ "kubescape" ]

