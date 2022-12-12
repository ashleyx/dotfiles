sudo pacman -S nvim tmux firefox zsh kitty waybar wofi dunst exa zoxide jq\
	swaybg btop nvtop tumbler --noconfirm

yay -S networkmanager-iwd grimshot clipman nerd-fonts slack-desktop postman-bin signal-desktop spotify ncpamixer-git --noconfirm 
yay -S xdg-desktop-portal-wlr-git bemenu-wayland 
mkdir ~/installs
git git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ~/installs/zsh-autocomplete
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/installs/powerlevel10k

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

