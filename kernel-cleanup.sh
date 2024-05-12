#!/bin/bash
# Kernel Cleanup
# Author: Alexia Michelle <alexiarstein@aol.com>
# For debian & GoldenDog systems
# License: MIT (See LICENSE.md for more info)
# Use: Run manually or ideally, add it as a cronjob to run weekly or monhtly.
# ---------------------------------------------------------------------------

boot_dir="/boot"
cd "$boot_dir" || exit
kernel_versions=$(ls vmlinuz-* | sed 's/^vmlinuz-//')
sorted_versions=$(echo "$kernel_versions" | sort -r)

# How many versions do we want to keep? Increase this number if you want to keep more than 2
kernels_to_keep=2
# Do not edit anything below, unless you know what you're doing :V

count=0
for version in $sorted_versions; do
    if [ $count -ge $kernels_to_keep ]; then
        echo "Removing old kernel version: $version"
        sudo rm "vmlinuz-$version"
        sudo rm "initrd.img-$version"
        sudo rm "System.map-$version"
        sudo rm "config-$version"
    fi
    ((count++))
done
