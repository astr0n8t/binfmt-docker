FROM docker.io/library/debian:bookworm AS bins

RUN apt update && apt install -y qemu-user-static binfmt-support

FROM tonistiigi/binfmt:latest AS binfmt

COPY --from=bins /usr/bin/qemu-* /usr/bin/

RUN for file in $(ls /usr/bin/qemu-*-static); do new_file="$(echo $file | sed -e 's/-static//g')" mv $file $new_file; done
