#!bi/bash

# Remove o libreoffice
sudo apt-get remove --purge libreoffice*
sudo apt remove --purge firefox*
sudo apt remove --purge transmission-gtk

# -----------------------------------------------------------------

# Programas essenciais
sudo apt install git    
sudo apt install code    
sudo apt install qbittorrent


# ---------------------------Flameshot-----------------------------


# Instalar e configurar Flameshot
sudo apt install flameshot

# Configurar atalho personalizado via gsettings
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "'Print Area'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "'flameshot gui'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "'<Super><Shift>s'"


# ---------------------------Homebrew------------------------------


# brew -> https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# confirma a instlação e encontra o local de instalação
find / -name brew -type f 2>/dev/null

# Adiciona ao path do fish
fish_add_path (dirname (which brew))


# ------------------------------uv----------------------------------


# instalar uv 
curl -LsSf https://astral.sh/uv/install.sh | sh


# ---------------------------Obsidian------------------------------


# Baixa, filtra a URL e passa para o wget baixar e instalar
curl -s https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | \
  jq -r '.assets[] | select(.name | endswith("_amd64.deb")) | .browser_download_url' | \
  xargs -I {} sudo /bin/bash -c 'wget -q -O /tmp/obsidian.deb {} && apt install -y /tmp/obsidian.deb && rm /tmp/obsidian.deb'