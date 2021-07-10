# Raspberry Pi Remote Snapshot

This is a simple docker container to create a disk image from a remote Raspberry Pi

[![dockeri.co](https://dockeri.co/image/mikenorgate/pi-snapshot)](https://hub.docker.com/r/mikenorgate/pi-snapshot)

## How to run

```
docker run [-it] -v <target_dir>:<output_dir> mikenorgate/pi-snapshot pi_address output_file
```
