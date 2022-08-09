# xpad-xac
Linux input driver (xpad) with X-Box Adaptive Controller (xac) support

This repo is a home for my interim development of changes to the Linux xpad input driver (drivers/input/joystick/xpad.c).

There are 4 branches:

 - main -> This mirrors (manually) the upstream driver at git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 - debug -> This adds chagnes to make debugging a bit easier (some output to dmesg)
 - xac -> This has the changes proposed for upstream merge
 - debug-xac -> This is a combo of the debug and xac branches, for debugging the proposed changes (the main working branch usually)
 
Also hosted here are some basic scripts/Makefile's to ease iteration.
