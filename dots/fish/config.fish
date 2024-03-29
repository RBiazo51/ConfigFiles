if status is-interactive
    # Commands to run in interactive sessions can go here
end

#if test -z $DISPLAY; and test (tty) = "/dev/tty1"
#    startx
#end

function fish_prompt
    echo (set_color FFF)'['(set_color blue)(whoami)(set_color FFF).(set_color cyan)(hostname) (set_color FFF)(dirs)'] '
end

set fish_greeting

alias q='exit'
alias e='exit'
alias c='clear'
alias f='fish'
alias pushdots='fish ~/GitHub/ConfigFiles/pushdots.sh'
alias pulldots='fish ~/GitHub/ConfigFiles/pulldots.sh'

# Uncomment depending on OS

# Arch
#alias reflect="sudo reflector --country 'United States',Canada --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist --verbose --latest 50 --number 15"

# Debian/Ubuntu
# Need to have netselect-apt installed
#alias reflect="sudo netselect-apt"

alias tweather="curl 'v2.wttr.in/tontitown?u'"
alias fweather="curl 'v2.wttr.in/fayetteville?u'"

function whatismyspeed
	echo (set_color cyan)Testing Internet Speed Now(set_color normal)
	set speedtest_output (speedtest --secure)
    set download_speed (echo $speedtest_output | grep -o 'Download: [0-9.]* Mbit/s' | cut -d ' ' -f 2)
    set upload_speed (echo $speedtest_output | grep -o 'Upload: [0-9.]* Mbit/s' | cut -d ' ' -f 2)

    echo (set_color red)Download:(set_color normal) $download_speed
    echo (set_color red)Upload:(set_color normal) $upload_speed
end

alias whatismydisk="sudo kdiskmark"

function whatismycolor
    set colors BLACK RED GREEN YELLOW BLUE MAGENTA CYAN WHITE
    for i in $colors
        echo -n (set_color $i)██
    end
    echo
    for i in $colors
        echo -n (set_color br$i)██
    end
    echo
    echo
    for i in $colors
        printf "%-8s" (set_color $i)██ $i
        printf "%-8s" (set_color br$i)██ br$i
        echo
    end
end

function whatismyip
    # Get external IP address
    set external_ip (curl -s icanhazip.com)

    # Get internal IP addresses
    set internal_interfaces (ip -o -4 route show | grep link | awk '{print $3}')
    
    # Print external information
    echo (set_color cyan)"External"
    echo (set_color normal)$external_ip

    # Print internal information
    echo (set_color cyan)"Internal"
    for interface in $internal_interfaces
        # Get internal IP address for each interface
        set internal_ip (ip -4 address show dev $interface | awk '/inet/ {print $2}')
        
        # Print internal interface name in uppercase and its IP address
        set_color red
        echo $interface | tr '[:lower:]' '[:upper:]'
        set_color normal
        echo $internal_ip
    end
end

set fish_cursor_default block
set fish_cursor_insert block
set fish_cursor_replace_one block
set fish_cursor_visual block
