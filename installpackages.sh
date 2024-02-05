mkdir ~/GitHub
cd ~/GitHub
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~/GitHub

yay -S reflector --noconfirm
sudo reflector --country 'United States',Canada --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist --verbose --latest 50 --number 15

sudo cp ~/GitHub/ConfigFiles/fonts/FragmentMono/FragmentMono-Regular.ttf /usr/share/fonts/FragmentMono.ttf

yay -S 7-zip arandr bleachbit brightnessctl feh firefox fish git gotop gparted grub-customizer gtk-chtheme htop imagemagick inetutils kdiskmark kitty lightdm-settings lxappearance man matcha-gtk-theme micro mousepad ncdu nemo numlockx peaclock pfetch picom polybar puzzles pywal-git rofi rofi-calc rofi-greenclip speedtest-cli sudo tree --noconfirm

git clone https://github.com/rbiazo51/Backgrounds
wal -i ~/GitHub/Backgrounds/eve1.png --saturate .6

fish ~/GitHub/ConfigFiles/pulldots.sh

sudo systemctl enable sshd
sudo systemctl start sshd
