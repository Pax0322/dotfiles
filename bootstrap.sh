#!/usr/bin/env bash
# Bootstrap script for David's minimalist XFCE workstation

set -e

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing core packages..."
sudo apt install -y xfce4 xfce4-goodies devilspie2 git curl \
    gddrescue testdisk photorec \
    mint-themes

echo "Installing Mint-X icons (manual copy if not in repos)..."
if [ -d "$HOME/dotfiles/icons" ]; then
    sudo cp -r $HOME/dotfiles/icons/* /usr/share/icons/
fi

echo "Symlinking dotfiles..."
ln -sf $HOME/dotfiles/xfce4 ~/.config/xfce4
ln -sf $HOME/dotfiles/devilspie2 ~/.devilspie2
ln -sf $HOME/dotfiles/autostart ~/.config/autostart
ln -sf $HOME/dotfiles/scripts ~/scripts

echo "Setting up autostart entries..."
mkdir -p ~/.config/autostart
cat > ~/.config/autostart/devilspie2.desktop <<EOF
[Desktop Entry]
Type=Application
Exec=devilspie2
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Devilspie2
EOF

cat > ~/.config/autostart/keep-awake.desktop <<EOF
[Desktop Entry]
Type=Application
Exec=xset s off -dpms s noblank
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Keep Display Awake
EOF

echo "Bootstrap complete! Log out/in to apply XFCE theme and autostart."
