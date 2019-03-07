FROM microsoft/azure-cli:2.0.47

LABEL version="0.0.0"

LABEL maintainer="eric and sai"
LABEL com.github.actions.name="Test kata-deploy in an AKS cluster"
LABEL com.github.actions.description="Wow.  Where do i start.  Create an AKS cluster with containerd+runtimeclass, then deploys kata onto it and even might start a workload. nbd"

ENV GITHUB_ACTION_NAME="Test kata-deploy in an AKS cluster"

RUN apk update \
  && rm -rf /var/cache/apk/* \
  && curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.12.0/bin/linux/amd64/kubectl \
  && chmod +x ./kubectl \
  && mv ./kubectl /usr/local/bin/kubectl \

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
