# Trench

New Depths of System Scripts

## Details
This is the Installation Script for Fedora43. Since Fedora43 is relatively new, I'm going to update it frequently until I switch to a new distro or Fedora44.

Other possibilities for distro hopping could be:

- OpenSUSE
- Arch
- Manjaro
- Ubuntu
- Mint
- CentOS
- RedHat

Right now, Fedora 43 doesn't support many features. I'm either going to leave it or find a workaround until a solution is available. So, don't expect everything to work. It might work for me because my machine might not be up to date.

## Docs

> Building Sphinx docs in future
Check `docs/` for docs

## Scripts

### tmux-sessionizer

This is tmux-sessionizer script borrowed from ThePrimeagen.

After invoking zsh you can use ctrl-f to start the tmux-sessionizer script and select one of directory on your system and start the session based on the directory name.

### cht

This is another script copied from ThePrimeagen.

This is to be used within the tmux, This script grabs your language specific queries from cht.sh website.

> I will be adding a lots of scripts here from my [dotfiles](https://github.com/PyDevC/.dot)

## Installation

clone this repository in your home directory.

run `install.sh` to get basic setup.

To create base container run one of the scripts in Container directory. Then install packages in containers with `containerinstall.sh`
