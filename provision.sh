#!/usr/bin/env bash

# Prevent grub updates to allow for initial automated update
echo "[*] Temporarily holding back grub package updates..."
sudo apt-mark hold grub2-common
sudo apt-mark hold grub-pc
sudo apt-mark hold grub-common

# Upgrade the System Packages
echo "[*] Updating system packages..."
sudo apt-get update
sudo apt-get upgrade -y

# Set environment variables
echo "[*] Setting bootstrap session environment variables..."
export HDIR=/home/vagrant
export SDIR=/vagrant

# Install essentials
echo "[*] Installing essential packages..."
sudo apt-get install -y git

# Kickstart
echo "[*] Kickstarting..."
git clone --depth 1 https://github.com/glarsen/kickstart.git /tmp/kickstart && \
cd /tmp/kickstart && \
./kick.sh ubuntu-xenial build python rust x86-c

# Dotfiles
echo "[*] Installing personalized dotfiles..."
git clone --depth 1 https://github.com/glarsen/dotfiles /tmp/dotfiles && \
cd /tmp/dotfiles && \
./install.sh vagrant

# Customize
echo "[*] Installing misc utilities..."
sudo apt-get install -y xtrace

# Remove the holds on Grub
echo "[*] Removing hold on grub packages..."
sudo apt-mark unhold grub-pc grub-common grub2-common

# Provisioning complete
echo "[*] Provisioning completed successfully!"

