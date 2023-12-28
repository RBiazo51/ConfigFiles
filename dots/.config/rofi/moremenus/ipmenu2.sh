theme="card_square"
dir="$HOME/.config/rofi/moremenus"

uptime=$(uptime -p | sed -e 's/up //g')

external=$(curl -s icanhazip.com)
internal=$(ip addr | awk '/inet /{print $2}' | cut -f1 -d'/')

rofi_command="rofi -theme $dir/$theme"

ip_info=""
for interface in $internal; do
    ip=$(ip addr show dev $interface | awk '/inet /{print $2}' | cut -f1 -d'/')
    ip_info+="\n$interface: $ip"
done

chosen="$(echo -e "$external$ip_info" | $rofi_command -p "IP Menu" -dmenu -selected-row 1)"
case $chosen in
    "$external") echo -n "$external" | xclip -selection clipboard;;
    *) # Extract the selected interface and its IP
       selected_interface=$(echo "$chosen" | awk -F ": " '{print $1}')
       selected_ip=$(echo "$chosen" | awk -F ": " '{print $2}')
       echo -n "$selected_ip" | xclip -selection clipboard
       ;;
esac
