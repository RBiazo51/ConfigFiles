theme="card_square"
dir="$HOME/.config/rofi/powermenu"

rofi_command="rofi -theme $dir/$theme"

chosen="$(echo "Clipboard1\nClipboard2" | $rofi_command -p "Clipboard History" -dmenu -selected-row 0)"

case $chosen in
	"Clipboard1") kitty htop ;;
    "Clipboard2") kitty gotop ;;
	*) exit 1 ;;
esac

#todo - make this show the history of the clipboard and allow you to chose from the last 5-10 things you've copied
#keep track of and show the most frequently copied things, kind of how rofi's dmenu replacement shows the most frequent apps at the top