# Configuração basica

echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

# https://github.com/fish-shell/fish-shell
sudo apt-add-repository ppa:fish-shell/release-4
sudo apt update
sudo apt install fish

# Desativa as boas vindas
fish
echo "set -U fish_greeting" >> ~/.config/fish/config.fish

# Instalar Starship
curl -sS https://starship.rs/install.sh | sh 
echo "starship init fish | source" >> ~/.config/fish/config.fish

# Configurar o fish como shell padrão
chsh -s /usr/bin/fish


# ----------------------------UTILITARIOS------------------------------------

# zoxide -> https://github.com/ajeetdsouza/zoxide
sudo apt install zoxide
echo "zoxide init fish | source" >> ~/.config/fish/config.fish


# Bat --> https://github.com/sharkdp/bat?tab=readme-ov-file#installation
sudo apt install batcat

mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

source ~/.config/fish/config.fish

