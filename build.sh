#!/usr/bin/bash

###
# Attribution and credit to https://github.com/medusalix/xone/blob/master/install.sh for
# some of the core here, i.e. copy to /usr/src vs having to work there etc
##

set -eu

if [ "$(id -u)" -ne 0 ]; then
	echo 'This script must be run as root!' >&2
	exit 1
fi

./clean.sh

version="0.1"
source="/usr/src/xpad-xac-${version}"
logs="/var/lib/dkms/xpad-xac/${version}build/make.log"

# Build from /usr/src dir
echo "Copying source to ${source}"
mkdir -p "${source}"
cp -r . "${source}"

# Replace #VERSION with our version
echo "Setting version: ${version}"
find "$source" -type f \( -name dkms.conf -o -name '*.c' \) -exec sed -i "s/#VERSION#/${version}/" {} +

# If we are in a debug branch, -DDEBUG
current_branch=$(git symbolic-ref HEAD --short)
echo "Current branch: $current_branch"
if [[ "${current_branch}" == *"debug"* ]]; then
	echo "Enabling -DDEBUG"
	echo 'ccflags-y += -DDEBUG' >> "${source}/Kbuild"
fi

if dkms install -m xpad-xac -v "${version}"; then
	echo "Build and installed"
else
	if [ -r "$logs" ]; then
		cat "$logs" >&2
	fi
	exit 1
fi
