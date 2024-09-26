install:
		printf 'Installing nvm'
		wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

stow:
		stow .config --target=../.config -v -v
