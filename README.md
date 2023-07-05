# post-install

## Instructions

1. Install [chezmoi](https://www.chezmoi.io/install/).
2. Install preferred dotfiles
   `chezmoi init git@github.com:eljpsm/$NAME.git`.
3. Apply the dotfiles `chezmoi apply`.
4. Install the preferred script `bash <(curl -Ls https://github.com/eljpsm/post-install/raw/main/script/$SCRIPT.sh)`.
