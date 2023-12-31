#NEEDS TESTING
#copy fish i3 kitty polybar rofi from .config NOT THE WHOLE FOLDER
for i in kitty polybar rofi i3
    cp -r ~/.config/$i/* ./dots/.config/$i/
end
cp ~/.config/fish/config.fish ./dots/.config/fish/config.fish

#copy picom from /etc/ NOT THE WHOLE FOLDER
cp /etc/xdg/picom.conf ./dots/etc/picom/picom.conf

#copy .mini .x from ~/
cp ~/.mini ./dots/gotop/.mini
cp ~/.x ./dots/gotop/.x