# xpad-xac
Linux input driver (xpad) with X-Box Adaptive Controller (xac) support

This repo is a home for my interim development of changes to the Linux xpad input driver (drivers/input/joystick/xpad.c).

There are 2 branches:

 - main -> This mirrors (manually) the upstream driver at git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 - debug -> This adds changes to make debugging a bit easier (some output to dmesg)
 
Also hosted here are some basic scripts/Makefile's to ease iteration.

To build/use a module (requires dkms, kernel headers):

```sudo ./build.sh```

To remove:

```sudo ./clean.sh```

Current state of patch proposed for upstream:
 - Accepted into 'next' via linux-input: https://patchwork.kernel.org/project/linux-input/list/?series=&submitter=206774&state=3&q=&archive=&delegate=
