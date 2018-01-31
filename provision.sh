#!/usr/bin/env bash

apt-mark hold grub2-common
apt-mark hold grub-pc
apt-mark hold grub-common

# Upgrade the System Packages
echo "[*] Updating system packages..."
apt-get update
apt-get upgrade -y

# Set environment variables
echo "[*] Setting bootstrap session environment variables..."
export HDIR=/home/vagrant
export SDIR=/vagrant

# Install essentials
echo "[*] Installing essential packages..."
sudo apt install -y git

# Kickstart
echo "[*] Kickstarting..."
git clone --depth 1 https://github.com/glarsen/kickstart.git /tmp/kickstart && \
cd /tmp/kickstart && \
./kick.sh ubuntu-xenial x86-c python rust

# Dotfiles
echo "[*] Installing personalized dotfiles..."
git clone --depth 1 https://github.com/glarsen/dotfiles /tmp/dotfiles && \
cd /tmp/dotfiles && \
./install.sh vagrant

# Customize
echo "[*] Installing misc utilities..."
sudo apt install -y xtrace

# Provisioning complete
echo "[*] Provisioning completed successfully!"

