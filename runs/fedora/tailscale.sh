#!/usr/bin/env bash

sudo dnf update -y
sudo dnf config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
sudo dnf install tailscale

sudo systemctl enable --now tailscaled
sudo tailscale up
tailscale ip -4
