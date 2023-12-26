theme="card_square"
dir="$HOME/.config/rofi/powermenu"

rofi_command="rofi -theme $dir/$theme"

chosen="$(echo "Clipboard1\nClipboard2" | $rofi_command -p "Clipboard History" -dmenu -selected-row 1)"

case $chosen in
	"Clipboard1") kitty htop ;;
    "Clipboard2") kitty gotop ;;
	*) exit 1 ;;
esac