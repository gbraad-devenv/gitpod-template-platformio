FROM gitpod/workspace-base

USER root

# Needed for the experimental network mode (to support Tailscale)
RUN curl -o /usr/bin/slirp4netns -fsSL https://github.com/rootless-containers/slirp4netns/releases/download/v1.1.12/slirp4netns-$(uname -m) \
    && chmod +x /usr/bin/slirp4netns

ENV PIP_USER=false
ENV PLATFORMIO_PENV_DIR=/home/gitpod/.platformio
ENV PATH="${PLATFORMIO_PENV_DIR}/bin:${PATH}"
RUN python3 -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/master/scripts/get-platformio.py)"

# Install user environment
CMD /bin/bash -l
USER gitpod
ENV USER gitpod
WORKDIR /home/gitpod
