# Installing arch core and extra repository packages
sudo pacman -S --noconfirm \
git \ # Version control
base-devel \
linux-headers \
btop \ # Proccess information
cronie \ # Cronjob handler
fastfetch \
feh \ # Wallpaper manager and image viewer
firefox \ # Browser
fzf \ # Fuzzy finder
ksnip \ # Screenshots
libqalculate \
libxtf \
lxappearance \
man-db \
mpv \
neovim \
nnn \
obsidian \
pulsemixer \
python \
python-pip \
npm \
clang \
dotnet-runtime-7.0 \
dotnet-sdk-7.0 \
reflector \
ripgrep \
rsync \
spotify-launcher \
stow \
tar \
thunar \
thunar-archive-plugin \
tldr \
ttf-hack-nerd \
ttf-jetbrains-mono \
ttf-roboto-mono-nerd \
unzip \
libxinerama \
lib32-libxinerama \
xorg-server \
xorg-xev \
xorg-xinit \
xorg-xprop \
xorg-xrandr \
zathura \
zathura-pdf-poppler

# Setting up yay
mkdir ~/Repos
mkdir ~/Repos/yay
git clone https://aur.archlinux.org/yay-bin.git ~/Repos/yay
cd ~/Repos/yay
makepkg -si

# Installing arch user repository packages
yay -S --noconfirm \
autojump \ # Additional config required
colorpicker \
discord_arch_electron \
heroic-games-launcher-bin \
libopenrazer \
razergenie \
librewolf-bin \
menu-qalc \
otf-openmoji \
picom-git \
protonup-qt \
spotify-tui \
visual-studio-code-bin

# Cloning all my suckless software configs
mkdir ~/suckless
git clone https://github.com/chrisbrinchlarsen/dwm.git ~/suckless/dwm
git clone https://github.com/chrisbrinchlarsen/st.git ~/suckless/st
git clone https://github.com/chrisbrinchlarsen/dmenu.git ~/suckless/dmenu
git clone https://github.com/chrisbrinchlarsen/slstatus.git ~/suckless/slstatus

# Making additionally required configuration folders
mkdir ~/.config/nvim
mkdir ~/Scripts

# Distributing dotfiles to their correct directories using stow
cd ~/ZDot && stow .

# Finishing the masterConfig suckless configuration file with proper path names
echo "static const char pathToHome[] = '$(echo $HOME)/';" >> ~/suckless/masterConfig.h
echo "static const char pathToPkgCountTXT[] = '$(echo $HOME)/suckless/slstatus/pkgCount.txt';" >> ~/suckless/masterConfig.h
echo "#endif" >> ~/suckless/masterConfig.h

# Installing all the suckless software
./suckless/smci.sh

# Booting up the desktop
startx


