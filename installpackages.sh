git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S kitty fish polybar picom rofi rofi-calc rofi-greenclip firefox pywal-git pfetch gotop peaclock inetutils nemo brightnessctl gparted feh ncdu man puzzles speedtest tree imagemagick arandr 7-zip reflector

git clone https://github.com/rbiazo51/Backgrounds
wal -i ~/GitHub/Backgrounds/eve1.png --saturate .6
