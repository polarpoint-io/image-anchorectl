FROM ubuntu:22.04 as build-stage

ARG ANCHORECTL_RELEASE_VERSION="1.2.0"

ENV ANCHORE_RELEASE_TAR="anchorectl_${ANCHORECTL_RELEASE_VERSION}_linux_amd64.tar.gz"
ENV ANCHORE_RELEASE_URL="https://anchorectl-releases.anchore.io/anchorectl/v${ANCHORECTL_RELEASE_VERSION}/${ANCHORE_RELEASE_TAR}"

RUN  apt-get update \
    && apt-get install -y gnupg git bash curl
RUN curl -SL ${ANCHORE_RELEASE_URL}  | tar -zxC /usr/local/bin

FROM ubuntu:22.04 as main-stage
COPY --from=build-stage /usr/local/bin/anchorectl /usr/bin/

RUN anchorectl --version

CMD ["/bin/anchorectl"]
