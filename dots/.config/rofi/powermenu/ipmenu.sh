theme="card_square"
dir="$HOME/.config/rofi/powermenu"

uptime=$(uptime -p | sed -e 's/up //g')

external=$(curl icanhazip.com)
internal=$(hostname -I | cut -f1 -d' ')

rofi_command="rofi -theme $dir/$theme"

chosen="$(echo "$external\n$internal" | $rofi_command -p "IP Menu" -dmenu -selected-row 1)"
case $chosen in
	"$external") kitty sleep 5;;
    "$internal") kitty sleep 5;;
	*) exit 1 ;;
esac