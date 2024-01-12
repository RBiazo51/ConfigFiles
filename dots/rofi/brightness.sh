# This is just setting some arbitrary LEDs on the keyboard for now since I don't have a laptop to test with.

theme="brightness"
dir="$HOME/.config/rofi/themes"

rofi_command="rofi -theme $dir/$theme"

options=("Maximum" "High" "Medium" "Low")
chosen=$($rofi_command -p "Brightness" -dmenu -selected-row 0 <<< "$(printf "%s\n" "${options[@]}")")
case $chosen in
	"Maximum") brightnessctl s 100%;;
	"High") brightnessctl s 75%;;
	"Medium") brightnessctl s 50%;;
	"Low") brightnessctl s 25%;;
	*) exit 1 ;;
esac
