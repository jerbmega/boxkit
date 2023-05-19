FROM quay.io/toolbx-images/alpine-toolbox:edge

LABEL com.github.containers.toolbox="true" \
      usage="My personal Boxkit image" \
      summary="A cloud-native version of the tools I use daily" \
      maintainer="jerbmega"

COPY extra-packages /
RUN apk update && \
    apk upgrade && \
    grep -v '^#' /extra-packages | xargs apk add
RUN rm /extra-packages

COPY bin /bin
RUN chmod +x /bin/wine # TODO don't hardcode this

# Add antigen (will be used by dotfiles later)
# There's no packages for this in Alpine but in this case it doesn't matter, 
# it's just a .zsh file and the end result is what's important here
RUN curl -L git.io/antigen > /usr/share/antigen.zsh

RUN   ln -fs /bin/sh /usr/bin/sh && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker-compose && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman-compose && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \ 
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/systemctl && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/distrobox && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/tailscale && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/updatedb && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/locate
