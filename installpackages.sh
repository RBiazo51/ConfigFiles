mkdir ~/GitHub
cd ~/GitHub
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~/GitHub

yay -S 7-zip arandr brightnessctl feh firefox fish git gotop gparted grub-customizer gtk-chtheme htop imagemagick inetutils kitty lightdm-settings lxappearance man matcha-gtk-theme micro ncdu nemo peaclock pfetch picom polybar puzzles pywal-git reflector rofi rofi-calc rofi-greenclip speedtest-cli sudo tree

git clone https://github.com/rbiazo51/Backgrounds
wal -i ~/GitHub/Backgrounds/eve1.png --saturate .6
