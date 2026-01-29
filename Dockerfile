FROM tonistiigi/binfmt:latest AS binfmt

FROM docker.io/library/debian:bookworm AS image
COPY --from=binfmt /go/bin/binfmt /usr/bin/binfmt


RUN apt update && apt install -y qemu-user-static binfmt-support

ENTRYPOINT [ "/usr/bin/binfmt" ]
