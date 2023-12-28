theme="card_square"
dir="$HOME/.config/rofi/moremenus"

uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/$theme"

chosen="$(echo "Logoff\nPower Off\nRestart" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 1)"
case $chosen in
	"Power Off") systemctl poweroff ;;
	"Restart") systemctl reboot ;;
	"Logoff") i3-msg exit ;;
	*) exit 1 ;;
esac
