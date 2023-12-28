theme="card_square"
dir="$HOME/.config/rofi/moremenus"

uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/$theme"

options="Logoff\nPower Off\nRestart"
chosen=$($rofi_command -p "Uptime: $uptime" -dmenu -selected-row 1 <<< "$options")
case $chosen in
	"Power Off") systemctl poweroff ;;
	"Restart") systemctl reboot ;;
	"Logoff") i3-msg exit ;;
	*) exit 1 ;;
esac
