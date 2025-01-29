#!/bin/bash

# Make sure that the script is not being run as root.
#
# This is a security measure to prevent the user from installing packages as root.
if [ "$(id -u)" -eq 0 ]; then echo "Must be a non-root user" >&2; exit 1; fi

# List all apt packages.
apt_packages=(
	build-essential
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

# Install Docker.
# See https://docs.docker.com/engine/install/ubuntu/
# Add Docker's official GPG key:
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

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
	bun
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
