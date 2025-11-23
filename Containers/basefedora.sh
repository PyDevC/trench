#!/usr/bin/env bash

# I will use Fedora 42 for as base
podman run -d --name basefedora fedora:42 sleep infinity
podman exec basefedora useradd -m pydevc
podman exec -it basefedora passwd pydevc
podman exec basefedora dnf install git sudo -y
podman exec basefedora usermod -aG wheel pydevc
podman exec basefedora groups pydevc
podman exec basefedora git clone https://github.com/PyDevC/trench.git /home/pydevc/trench
podman commit basefedora basefedora
