FROM tonistiigi/binfmt:latest AS binfmt

FROM docker.io/library/debian:bookworm AS image
COPY --from=binfmt /usr/bin/binfmt /usr/bin/binfmt


RUN apt update && apt install -y qemu-user-static binfmt-support

ARG BINARY_PREFIX
RUN cd /usr/bin; [ -z "$BINARY_PREFIX" ] || for f in $(ls qemu-*); do ln -s $f $BINARY_PREFIX$f; done

ARG QEMU_PRESERVE_ARGV0
ENV QEMU_PRESERVE_ARGV0=${QEMU_PRESERVE_ARGV0}
ENTRYPOINT [ "/usr/bin/binfmt" ]
VOLUME /tmp
