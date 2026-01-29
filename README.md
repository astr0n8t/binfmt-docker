# binfmt-docker
Custom docker binfmt 

## Backstory:
```

QEMU emulated NixOS builds for aarch64 on amd64 appear to not work correctly with "cannot allocate memory" errors.  By utilizing an older version of QEMU, these errors seem to disappear.

```

Meant to be used with the [docker/setup-qemu-action](https://github.com/docker/setup-qemu-action) GitHub action
