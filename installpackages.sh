mkdir ~/GitHub
cd ~/GitHub
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~/GitHub

yay -S 7-zip arandr brightnessctl feh firefox fish gotop gparted grub-customizer gtk-chtheme imagemagick inetutils kitty lightdm-settings lxappearance man matcha-gtk-theme ncdu nemo peaclock pfetch picom polybar puzzles pywal-git reflector rofi rofi-calc rofi-greenclip speedtest speedtest-cli tree

git clone https://github.com/rbiazo51/Backgrounds
wal -i ~/GitHub/Backgrounds/eve1.png --saturate .6
