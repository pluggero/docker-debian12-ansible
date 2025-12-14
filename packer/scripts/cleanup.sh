#!/bin/bash
# Cleanup script to finalize the container image
set -euo pipefail

# Remove apt cache and lists
rm -rf /var/lib/apt/lists/*

# Remove documentation to reduce image size
rm -Rf /usr/share/doc
rm -Rf /usr/share/man

# Clean apt cache
apt-get clean

# Remove getty target to prevent systemd from starting gettys on tty[1-6]
rm -f /lib/systemd/system/multi-user.target.wants/getty.target
