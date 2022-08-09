#!/usr/bin/bash

set -eu

if [ "$(id -u)" -ne 0 ]; then
	echo 'This script must be run as root!' >&2
	exit 1
fi

installed_modules=$(lsmod | grep '^xpad' | cut -d ' ' -f 1 | tr '\n' ' ')
installed_version=$(dkms status xpad | head -n 1 | tr -s ',:/' ' ' | cut -d ' ' -f 2)

if [ -n "${installed_modules}" ]; then
	echo "Unloading xpad module"
	modprobe -r -a ${installed_modules}
fi

if [ -n "${installed_version}" ]; then
	echo "Uninstall xpad ${installed_version}"
	dkms remove -m xpad -v "${installed_version}" --all
	rm -r "/usr/src/xpad-${installed_version}"
else
	echo "Driver not installed" >&2
fi
