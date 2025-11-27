# ROCM 

ROCM is a compiler stack which provides gpu harware acceleration for AMD GPUs.

ROCM have something called HIP and HIPIFY which can run and convert cuda code to run on amd gpu.

## Explain script

### log function
takes in two argument one is message type and another is message
type can be -i, -p or -n

-i is to log the message as installation message
-p is to log the message as permission or membership message
-n is to log the message as whole normally

### Installing prerequisites
This involves installation of general packages, python dependencies, and environment modules.

Most of these are already installed from the beginning.

### Assign group membership to the user

Assign video and render group to the user

### get gpg keys
This step does not require any general description

### register package in apt/source.list.d/

### install rocm
you can install rocm after updating apt with newly installed packages.

### setup configuration for rocm in /etc/ld.so.conf.d/rocm.conf
write some config and then update with ldconfig

### Export ROCm paths and reboot
