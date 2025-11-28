# How to Start Containers

Different containers need to be started in different ways with different privelages.

## General Container

This Container contains the softwares that requires display which is done using x11 forwarding.
We also need to connect device /dev/snd inorder to allow sound from things like players or browser.

```bash
podman run -it --name general -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --device /dev/snd \
    --user pydevc \
    --userns=keep-id \
    --security-opt label=disable localhost/basefedora:latest bash
```

## PyTorch Container

pytorch container uses ROCm which requires some usage of kernel and other devices so we link those devices while running the container.

```bash
podman run -it --name torchwork -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --device /dev/snd --device /dev/kfd \
    --user pydevc \
    --userns=keep-id \
    --security-opt label=disable localhost/baseubuntu:latest bash
```

## DevEnv Container

DevEnv container uses most of the development tools and is only cli based, hence no X11 forwarding is required but inorder to avoid any future trouble we allow it.

## LLVM Container

LLVM Conatiner is just for building compilers or testing LLVM builds.

## RemoteUser Container

This is a special container that will be used for remote logins only, we will use tailscale to connect to internet and allow me to connect via ssh.
