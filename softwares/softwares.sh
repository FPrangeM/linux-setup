#!bi/bash

# Remove o libreoffice
sudo apt-get remove --purge libreoffice* -y
sudo apt remove --purge firefox* -y
sudo apt remove --purge transmission-gtk -y

# Programas essenciais
# -----------------------------------------------------------------

# Github cli 
sudo apt install gh -y
# git config --global user.email "you@example.com"
# git config --global user.name "Your Name"


# Vscode
wget -O /tmp/code_latest.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo apt install -y /tmp/code_latest.deb
rm /tmp/code_latest.deb

# qbittorrent
sudo apt install qbittorrent -y

# Resources (flatpak)
flatpak install flathub net.nokyan.Resources -y

# Manipulador de dicionarios - jq
sudo apt install jq -y


# ---------------------------Flameshot-----------------------------


# Instalar e configurar Flameshot
sudo apt install flameshot -y

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
curl -LSf https://astral.sh/uv/install.sh | sh


# ---------------------------Obsidian------------------------------


# Baixa, filtra a URL e passa para o wget baixar e instalar
URL_OBSIDIAN=$(curl -s https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | \
  jq -r '.assets[] | select(.name | endswith("_amd64.deb")) | .browser_download_url')
echo "Baixando de: $URL_OBSIDIAN"
wget -O /tmp/obsidian_latest.deb "$URL_OBSIDIAN"
sudo apt install -y /tmp/obsidian_latest.deb
rm /tmp/obsidian_latest.deb



# ---------------------------WezTerm------------------------------

curl -fSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo chmod 644 /usr/share/keyrings/wezterm-fury.gpg

sudo apt update
sudo apt install wezterm -y

cp ./wezterm/.wezterm.lua ~/.wezterm.lua