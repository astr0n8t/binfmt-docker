FROM docker.io/library/debian:bookworm AS bins

RUN apt update && apt install -y qemu-user-static binfmt-support

RUN for file in $(ls /usr/bin/qemu-*-static); do mv $file ${file%-static}; done

FROM tonistiigi/binfmt:latest AS binfmt

COPY --from=bins /usr/bin/qemu-* /usr/bin/

