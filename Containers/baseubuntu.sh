#!/usr/bin/env bash

# I will use Fedora 42 for as base
podman run -d --name baseubuntu ubuntu sleep infinity
podman exec baseubuntu useradd -m pydevc
podman exec -it baseubuntu passwd pydevc
podman exec baseubuntu apt install sudo -y
podman exec baseubuntu usermod -aG sudo pydevc
podman exec baseubuntu groups pydevc
podman commit baseubuntu baseubuntu
