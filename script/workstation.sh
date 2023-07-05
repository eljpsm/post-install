#!/bin/bash

# Make sure that the script is not being run as root.
#
# This is a security measure to prevent the user from installing packages as root.
if [ "$(id -u)" -eq 0 ]; then echo "Must be a non-root user" >&2; exit 1; fi

# Install dotfiles.
chezmoi init git@github.com:eljpsm/dotfiles.git

# List all APT packages.
#
# Add any APT packages that you want to install to this array.
apt=(
	curl
	zsh
	git
	git-crypt
	direnv
	stow
	nmap
	libfuse2
	python3-pip
	python3-venv
	neovim
	emacs
)
sudo apt update
sudo apt install "${apt[*]}" -y

# Install zplug.
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
# Install Starship.
curl -sS https://starship.rs/install.sh | sh
# Install n.
curl -L https://bit.ly/n-install | bash -s -- -y

# List all NPM packages.
#
# Add any NPM packages that you want to install to this array.
#
# Note that each package is installed globally.
npm=(
	serverless
	yarn
)
npm install -g "${npm[*]}"

# Install pipx.
#
# This is an isolated environment for Python packages.
python3 -m pip install --user pipx
python3 -m pipx ensurepath

# List all Python packages.
#
# Add any Python packages that you want to install to this array.
pipx=(
	poetry
	aws-mfa
	awscli
	shell-gpt
)
for val in "${pipx[@]}"; do
	pipx install "$val"
done

# Change the user's shell to ZSH.
chsh -s "$(which zsh)"
