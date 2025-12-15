#!bi/bash

# Remove o libreoffice
sudo apt-get remove --purge libreoffice* -y
sudo apt remove --purge firefox* -y
sudo apt remove --purge transmission-gtk -y

# Programas essenciais
# -----------------------------------------------------------------

# Github cli 
sudo apt install gh
# git config --global user.email "you@example.com"
# git config --global user.name "Your Name"


# Vscode
sudo apt-get install wget gpg &&
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg &&
sudo install -D -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft.gpg &&
rm -f microsoft.gpg

echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null

sudo apt update
sudo apt install code


# qbittorrent
sudo apt install qbittorrent -y

# Resources (flatpak)
flatpak install flathub net.nokyan.Resources -y



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
curl -LsSf https://astral.sh/uv/install.sh | sh


# ---------------------------Obsidian------------------------------


# Baixa, filtra a URL e passa para o wget baixar e instalar
curl -s https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | \
  jq -r '.assets[] | select(.name | endswith("_amd64.deb")) | .browser_download_url' | \
  xargs -I {} sudo /bin/bash -c 'wget -q -O /tmp/obsidian.deb {} && apt install -y /tmp/obsidian.deb && rm /tmp/obsidian.deb'


# ---------------------------WezTerm------------------------------

curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo chmod 644 /usr/share/keyrings/wezterm-fury.gpg

sudo apt update
sudo apt install wezterm

cp ./wezterm/.wezterm.lua ~/.wezterm.lua