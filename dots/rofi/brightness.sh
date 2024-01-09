# This is just setting some arbitrary LEDs on the keyboard for now since I don't have a laptop to test with.

theme="brightness"
dir="$HOME/.config/rofi/themes"

rofi_command="rofi -theme $dir/$theme"

options=("High" "Medium" "Low")
chosen=$($rofi_command -p "Brightness" -dmenu -selected-row 1 <<< "$(printf "%s\n" "${options[@]}")")
case $chosen in
	"High") brightnessctl -d "input9::capslock" s 1;;
	"Medium") brightnessctl -d "input9::numlock" s 1;;
	"Low") brightnessctl -d "input9::scrolllock" s 1;;
	*) exit 1 ;;
esac
