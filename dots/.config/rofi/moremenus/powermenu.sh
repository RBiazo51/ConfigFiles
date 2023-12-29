theme="powermenu"
dir="$HOME/.config/rofi/moremenus"

uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/$theme"

options=("Logoff" "Shutdown" "Restart")
chosen=$($rofi_command -p "Uptime: $uptime" -dmenu -selected-row 1 <<< "$(printf "%s\n" "${options[@]}")")
case $chosen in
	"Shutdown") systemctl poweroff ;;
	"Restart") systemctl reboot ;;
	"Logoff") i3-msg exit ;;
	*) exit 1 ;;
esac
