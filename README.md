# MANGOS tools bundle

mkosi uses a lot of different tools to do its job. By default
it will use the tools available on the host, but for a more
consistent build process, it's better to build a tools bundle
and use that instead.

## Build instructions

To build this locally, run:

```
make download verify bootstrap mkosi.tools clean build mkosi.tools
```

1. `make download`: Downloads cosign and syft
2. `make verify`: Verifies cosign and syft against known checksums
3. `make bootstrap`: Builds tools tarball in bootstrap mode
4. `make mkosi.tools`: Extracts the built tools into mkosi.tools
5. `make clean`: Cleans up the build artifacts
6. `make build`: Performs a regular, full build
7. `make mkosi.tools`: Replaces `mkosi.tools` from step 4 with the fully built version
