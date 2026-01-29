FROM docker.io/library/debian:bookworm

RUN apt update && apt install -y qemu-user-static binfmt-support qemu-user-binfmt

ENTRYPOINT [ "/usr/sbin/update-binfmts" ]
