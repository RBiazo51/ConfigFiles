theme="keyboard"
dir="$HOME/.config/rofi/themes"

rofi_command="rofi -theme $dir/$theme"

options=("High" "Low" "Off")
chosen=$($rofi_command -p "Keyboard" -dmenu -selected-row 0 <<< "$(printf "%s\n" "${options[@]}")")
case $chosen in
	"High") brightnessctl -d tpacpi::kbd_backlight s 2;;
    "Low") brightnessctl -d tpacpi::kbd_backlight s 1;;
    "Off") brightnessctl -d tpacpi::kbd_backlight s 0;;
	*) exit 1 ;;
esac
