#!/usr/bin/env bash

log(){
    if [[ $1 == "-i" || $# -eq 1 ]]; then
        echo "Installing: $2"
    elif [[ $1 == "-p" ]]; then
        echo "Checking permissions and membership: $2"
    elif [[ $1 == "-n" ]]; then
        echo "$2"
    else
        echo "${@}"
    fi
}

log "prerequisites"
sudo apt install git wget gnupg sudo

log "python dependences"
sudo apt install python3-setuptools python3-wheel

log "env-modules"
sudo apt install environment-modules

log "-p" "Group Membership"
sudo usermod -a -G video,render $LOGNAME
# For customizing group permissions go through ROCm official installation prerequisites and modify above line

log "Package signing key" " only for Ubuntu"
# Make the directory if it doesn't exist yet.
# This location is recommended by the distribution maintainers.
sudo mkdir --parents --mode=0755 /etc/apt/keyrings

# Download the key, convert the signing-key to a full
# keyring required by apt and store in the keyring directory
wget https://repo.radeon.com/rocm/rocm.gpg.key -O - | \
    gpg --dearmor | sudo tee /etc/apt/keyrings/rocm.gpg > /dev/null

# Need custom installation for this

log "Reginstering packages"

echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/rocm.gpg] https://repo.radeon.com/rocm/apt/6.4.1 noble main" \
    | sudo tee --append /etc/apt/sources.list.d/rocm.list
echo -e 'Package: *\nPin: release o=repo.radeon.com\nPin-Priority: 600' \
    | sudo tee /etc/apt/preferences.d/rocm-pin-600
sudo apt update

log "ROCm"
sudo apt install rocm

log "Post installation"
sudo tee --append /etc/ld.so.conf.d/rocm.conf <<EOF
/opt/rocm/lib
/opt/rocm/lib64
EOF
sudo ldconfig

log "-n" "Export ROCm path"
export PATH=$PATH:/opt/rocm-6.4.1/bin
export LD_LIBRARY_PATH=/opt/rocm-6.4.1/lib

echo "Add this to your .zshrc or .bashrc"
echo "export PATH=$PATH:/opt/rocm-6.4.1/bin"
echo "export LD_LIBRARY_PATH=/opt/rocm-6.4.1/lib"

echo "-n" "Installation complete reboot your system"
