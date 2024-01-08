theme="ipmenu"
dir="$HOME/.config/rofi/themes"

uptime=$(uptime -p | sed -e 's/up //g')

external=$(curl -s icanhazip.com)
internal=$(ip addr | awk '/inet / && $2 !~ /^127\./ {gsub(/\/.*/, "", $2); print $2}')

rofi_command="rofi -theme $dir/$theme"

chosen="$(echo -e "$external\n$internal" | $rofi_command -p "IP Menu" -dmenu -selected-row 1)"
case $chosen in
    "$external") echo -n "$external" | xclip -selection clipboard;;
    *) # Extract the selected IP
       selected_ip=$(echo "$chosen" | awk '{print $1}')
       echo -n "$selected_ip" | xclip -selection clipboard
       ;;
esac
