#First steps upon booting into the ISO
#Connect to internet (with WiFi or with Ethernet)
#If using WiFi use iwctl
iwctl
station wlan0 connect "SSID" #wlan0 or whatever your interface is

#Verify Internet Connection
ping aur.archlinux.org

#Run the arch install helper
archinstall

#List of Extra Packages
#(iwd, dhcpcd) OR networkmanager, sudo, micro, git

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
#Navigate to the correct directory
cd yay
#Make the package
makepkg -si
#Verify the install worked, or just try install something
yay --version
#OR
yay -Syyu
#OR as an example
yay -S pfetch

#Download this repository
git clone https://github.com/rbiazo51/ConfigFiles

#Ideally at some point there will be a way to run a script to automatically copy over all relevant files in this repository, but for now, manually cp files to the right locations.

#Disable Sleep on Lid Closing
sudo micro /etc/systemd/logind.conf
#Edit the following line
HandleLidSwitch=ignore
