# NEEDS TESTING

cd ~/GitHub/ConfigFiles/

# copy entire i3 kitty polybar rofi folder from ~/.config to ConfigFiles
for i in kitty polybar rofi i3 micro
    cp -r ~/.config/$i/* ./dots/$i/
end

# Copy only config.fish from ~/.config
cp ~/.config/fish/config.fish ./dots/fish/config.fish

# copy only picom.conf from /etc/xdg/
sudo cp /etc/xdg/picom.conf ./dots/picom/picom.conf

# copy .mini .x from ~/
cp ~/.mini ./dots/gotop/.mini
cp ~/.x ./dots/gotop/.x