#First steps upon booting into the ISO
#Connect to internet (with WiFi or with Ethernet)
#If using WiFi use iwctl
station wlan0 connect "SSID"

#Verify Internet Connection
ping aur.archlinux.org

#Run the arch install helper
archinstall

#List of Extra Packages
#iwctl, dhcpcd OR networkmanager, sudo, micro, git

#Then after booting into new system

#Enable and start networking related services
sudo systemctl enable iwd
sudo systemctl start iwd
sudo systemctl enable dhcpcd
sudo systemctl start dhcpcd

#OR

#Enable and start networking related services
sudo systemctl enable networkmanager
sudo systemctl start networkmanager

#Download and install yay (package manager that uses AUR, default of pacman doesn't use AUR)
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --version

#Download this repository
git clone https://github.com/rbiazo51/ConfigFiles

#Ideally at some point there will be a way to run a script to automatically copy over all relevant files in this repository.

#Disable Sleep on Lid Closing
sudo micro /etc/systemd/logind.conf
#Edit the following line
HandleLidSwitch=ignore
