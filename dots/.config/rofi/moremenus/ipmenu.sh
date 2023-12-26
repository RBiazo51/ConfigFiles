theme="card_square"
dir="$HOME/.config/rofi/moremenus"

uptime=$(uptime -p | sed -e 's/up //g')

external=$(curl icanhazip.com)
internal=$(hostname -I | cut -f1 -d' ')

rofi_command="rofi -theme $dir/$theme"

chosen="$(echo "$external\n$internal" | $rofi_command -p "IP Menu" -dmenu -selected-row 1)"
case $chosen in
	"$external") echo -n "$external" | xclip -selection clipboard;;
    "$internal") echo -n "$internal" | xclip -selection clipboard;;
	*) exit 1 ;;
esac