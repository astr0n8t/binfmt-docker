FROM docker.io/library/debian:bullseye

RUN apt update && apt install -y qemu-user-static binfmt-support

ENTRYPOINT [ "/usr/bin/binfmt" ]
