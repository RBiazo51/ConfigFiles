theme="card_square"
dir="$HOME/.config/rofi/moremenus"

uptime=$(uptime -p | sed -e 's/up //g')

external=$(curl -s icanhazip.com)
internal=$(ip addr | awk '/inet / && $2 !~ /^127\./ {gsub(/\/.*/, "", $2); print $2}')

rofi_command="rofi -theme $dir/$theme"

ip_info=""
for interface in $internal; do
    ip=$(ip addr show dev $interface | awk '/inet /{gsub(/\/.*/, "", $2); print $2}')
    ip_info+="\n$interface: $ip"
done

chosen="$(echo -e "External: $external$ip_info" | $rofi_command -p "IP Menu" -dmenu -selected-row 1)"
case $chosen in
    "External:"*) echo -n "$external" | xclip -selection clipboard;;
    *) # Extract the selected IP
       selected_ip=$(echo "$chosen" | awk '{print $2}')
       echo -n "$selected_ip" | xclip -selection clipboard
       ;;
esac
