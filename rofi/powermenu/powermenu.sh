theme="card_square"
dir="$HOME/.config/rofi/powermenu"

uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/$theme"

chosen="$(echo -e "Restart\nPower Off\nLogoff" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"
case $chosen in
	"Power Off") poweroff ;;
	"Restart") reboot ;;
	"Logoff") i3-msg exit ;;
	*) exit 1 ;;
esac
