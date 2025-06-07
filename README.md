### Installing vim-plug

[vim-plug Github](https://github.com/junegunn/vim-plug)

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Then open vim and run `:PlugInstall`

### Installing fish shell

[Fish shell Github](https://github.com/fish-shell/fish-shell) - [Website](https://fishshell.com/)

```sh
sudo apt-add-repository ppa:fish-shell/release-4
sudo apt update
sudo apt install fish
```

#### Installing oh-my-fish and angoster theme

[OMF Github](https://github.com/oh-my-fish/oh-my-fish)

```sh
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

omf install agnoster # Probably like this
```

Don't forget to install a nerd font to see all the symbols: [Nerd font downloads](https://www.nerdfonts.com/font-downloads)



### Downloading Node.js NVM and enabling `pnpm`

[Download page](https://nodejs.org/en/download/current)

```sh
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 24

# Verify the Node.js version:
node -v # Should print "v24.1.0".
nvm current # Should print "v24.1.0".

# Download and install pnpm:
corepack enable pnpm

# Verify pnpm version:
pnpm -v
```

Don't forget to run `pnpm setup` to create the global directory for pnpm global packages. The necessary env variables are in the `config.fish`.

#### Making nvm work in fish

Need to update the `~/.config/fish/...`. Turns out those files are also available in the nvm [GitHub's readme](https://github.com/nvm-sh/nvm?tab=readme-ov-file#fish)


### Creating SSH keys for github

[Official tutorial](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)


```sh
# Generating a new SSH key
ssh-keygen -t ed25519 -C "your_email@example.com"

# Start the ssh-agent in the background.
eval "$(ssh-agent -s)" # In fish, probably needs `eval (ssh-agent -s), plus the .config/fish/config.fish

# Add your SSH private key to the ssh-agent.
ssh-add ~/.ssh/id_ed25519

# Copy the public key
xsel --clipboard < ~/.ssh/id_ed25519.pub
```

Add the SSH public key to your account on GitHub (in settings).
