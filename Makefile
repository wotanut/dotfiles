install:
		printf 'Installing nvm'
		wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
		printf 'Installing Oh My Posh'
		curl -s https://ohmyposh.dev/install.sh | bash -s

stow:
		stow .config --target=../.config -v -v
