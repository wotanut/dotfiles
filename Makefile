# Get the absolute path of the Dotfiles directory
DOTFILES := $(shell pwd)

install:
	@printf 'Installing nvm...\n'
	@wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
	@printf 'Installing Oh My Posh...\n'
	@curl -s https://ohmyposh.dev/install.sh | bash -s

stow:
	@printf 'Stowing Neovim config...\n'
	# -D deletes existing links to prevent duplicates
	# -R restows the package 'nvim' into target '~'
	stow -D nvim -t ~ 2>/dev/null || true
	stow -R nvim -t ~ -v
	@printf 'Done! Verification: '
	@ls -l ~/.config/nvim | grep "\->"

delete:
	stow -D .config -t ~ -v
