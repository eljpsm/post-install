#!/bin/bash

# Make sure that the script is not being run as root.
#
# This is a security measure to prevent the user from installing packages as root.
if [ "$(id -u)" -eq 0 ]; then echo "Must be a non-root user" >&2; exit 1; fi

# List all APT packages.
#
# Add any APT packages that you want to install to this array.
apt=(
	curl
	git
	git-crypt
	stow
	direnv
	nmap
	libfuse2
	python3-pip
	python3-venv
	neovim
	pipx
)
sudo apt update
sudo apt install "${apt[@]}" -y

# Install n.
curl -L https://bit.ly/n-install | bash 

# Install pnpm.
npm install -g pnpm@latest-10

# Install pipx.
pipx ensurepath

# List all Python packages.
#
# Add any Python packages that you want to install to this array.
pipx=(
)
for val in "${pipx[@]}"; do
	pipx install "$val"
done

