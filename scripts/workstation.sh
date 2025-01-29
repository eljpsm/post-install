#!/bin/bash

# Make sure that the script is not being run as root.
#
# This is a security measure to prevent the user from installing packages as root.
if [ "$(id -u)" -eq 0 ]; then echo "Must be a non-root user" >&2; exit 1; fi

# List all apt packages.
apt_packages=(
	curl
	git
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
sudo apt install "${apt_packages[@]}" -y

# List all snap packages with classic flag.
snap_classic_packages=(
	aws-cli
	code
)
sudo snap install "${snap_classic_packages[@]}" --classic

# Install n.
curl -L https://bit.ly/n-install | bash 

# List all npm packages.
npm_packages=(
	pnpm
)
for pkg in "${npm_packages[@]}"; do
	npm install -g "$pkg"
done

# Install pipx.
pipx ensurepath

# List all pipx packages.
pipx_packages=(
)
for pkg in "${pipx_packages[@]}"; do
	pipx install "$pkg"
done
