theme="card_square"
dir="$HOME/.config/rofi/moremenus"

uptime=$(uptime -p | sed -e 's/up //g')

external=$(curl -s icanhazip.com)
internal=$(ip addr | awk '/inet / && $2 !~ /^127\./ {gsub(/\/.*/, "", $2); print $2}')

rofi_command="rofi -theme $dir/$theme"

chosen="$(echo -e "$external\n$internal" | $rofi_command -p "IP Menu" -dmenu -selected-row 1)"
case $chosen in
    "$external") echo -n "$external" | xclip -selection clipboard;;
    "$internal") echo -n "$internal" | xclip -selection clipboard;;
    *) exit 1 ;;
esac
