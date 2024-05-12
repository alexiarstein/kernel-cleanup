#!/bin/bash
# Kernel Cleanup
# Author: Alexia Michelle  <alexiarstein@aol.com>

# Variables:

boot_dir="/boot" # Define the directory where cleaning is performed
kernel_files=$(ls vmlinuz-* initrd.img-* System.map-*)
kernels_to_keep=2 # How many kernels do we want to keep in the system

# Do not edit anything below (Unless you know what you're doing)

cd "$boot_dir" || exit
sorted_files=$(echo "$kernel_files" | sort -r)
count=0
for file in $sorted_files; do
    if [ $count -ge $kernels_to_keep ]; then
        echo "Removing old kernel: $file"
        sudo rm "$file"
        sudo rm "$(basename "$file" vmlinuz-*).img"
        sudo rm "$(basename "$file" vmlinuz-*)"
        sudo rm "$(basename "$file" vmlinuz-*)"
    fi
    ((count++))
done
