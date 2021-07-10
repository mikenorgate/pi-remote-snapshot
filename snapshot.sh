#!/bin/bash

set -e

PI_ADDRESS="${1}"
OUTPUT="${2}"

help() {
	local help
	read -r -d '' help << EOM
Usage: docker run [-it] --privileged --rm -v <target_dir>:<output_dir> mikenorgate/pi-snapshot pi_address output_file
EOM
	echo "$help"
	exit 1
}

if [[ -z "$PI_ADDRESS" ]]; then
  help
fi

if [[ -z "$OUTPUT" ]]; then
  help
fi

mkdir /tmp

ssh -o StrictHostKeyChecking=no pi@$PI_ADDRESS "sudo dd if=/dev/mmcblk0 bs=64M status=progress" | dd of=/tmp/pi_clone.img

/pishrink.sh -vZa /tmp/pi_clone.img

cp -f /tmp/pi_clone.img.xz $OUTPUT