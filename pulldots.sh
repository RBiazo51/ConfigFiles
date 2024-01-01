# NEEDS TESTING

# Set Working Directory
cd ~/GitHub/ConfigFiles/dots/

# List of Configurations
set configurations fish gotop i3 kitty polybar rofi

# Create Folders
for i in $configurations
    set config_dir ~/.config/$i

    # Check if the directory exists
    if test -d $config_dir
        echo "Directory $config_dir already exists."
    else
        # Create the directory
        mkdir -p $config_dir
        echo "Directory $config_dir created."
    end
end

# Copy 'fish' Config
cp ./fish/config.fish ~/.config/fish/config.fish

# Copy 'gotop' Layouts
cp ./gotop/.mini ~/.mini
cp ./gotop/.x ~/.x

# Copy 'i3' Config
cp ./i3/config ~/.config/i3/config

# Copy 'kitty' Config
cp ./kitty/kitty.conf ~/.config/kitty/kitty.conf

# Copy 'micro' Settings
cp ./micro/settings.json ~/.config/micro/settings.json

# Copy 'picom' Config
sudo cp ./picom/picom.conf /etc/xdg/picom.conf

# Copy 'polybar' Bar
cp ./polybar/config.ini ~/.config/polybar/config.ini

# Copy Entire 'rofi' Folder
cp -r ./rofi ~/.config/