# post-install

## Instructions

1. Install required dependencies.
   
   ```bash
   sudo apt install git curl
   ```

2. Install [chezmoi](https://www.chezmoi.io/install/).
3. Install preferred dotfiles
   `chezmoi init git@github.com:eljpsm/dotfiles.git`.
4. Apply the dotfiles `chezmoi apply`.
5. Install the preferred script `bash <(curl -Ls https://github.com/eljpsm/post-install/raw/main/script/<script>)`,
   where `<script>` is the script file name found within [scripts](./scripts).
