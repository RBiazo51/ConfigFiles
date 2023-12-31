if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt
    echo (set_color FFF)'['(set_color blue)(whoami)(set_color FFF).(set_color cyan)(hostname) (set_color FFF)(dirs)'] '
end

set fish_greeting

alias q='exit'
alias e='exit'
alias c='clear'

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

function whatismydisk
    set output "/tmp/test.img"
    for input in zero random
        # Display the section header based on the value of $input
        echo (set_color cyan)(if [ $input = "zero" ]; echo "Zeros"; else if [ $input = "random" ]; echo "Random"; end)(set_color normal)
        # Run dd to test the speed of /dev/$input and capture it's output
        set dd_output (dd if=/dev/$input of=$output bs=1G count=1 oflag=dsync 2>&1 | awk '/copied/ {print $8, $9, $10, $11}')
        # Format and display the relevant parts of dd's output
        echo $dd_output | awk '{printf "%.6f Seconds\n%.1f %s\n", $1, $3, $4}'
        # Remove the temporary output file
        rm $output
    end
end

function whatismycolor
    for i in BLACK BLUE CYAN GREEN MAGENTA RED WHITE YELLOW
        echo -n (set_color $i)██
    end
    echo
    for i in BLACK BLUE CYAN GREEN MAGENTA RED WHITE YELLOW
        echo -n (set_color br$i)██
    end
    echo
    echo
    for i in BLACK BLUE CYAN GREEN MAGENTA RED WHITE YELLOW
        printf "%-8s" (set_color $i)██ $i
        printf "%-8s" (set_color br$i)██ br$i
        echo
    end
end

function whatismyip
	echo (set_color cyan)External(set_color normal)
	curl icanhazip.com
	echo (set_color cyan)Internal(set_color normal)
	ip addr show | awk '/inet / && !/127.0.0.1/ {
		printf "\033[1;31m%s\033[0m\n%s\n", toupper($NF), $2
	}' | cut -d"/" -f1
end 

set fish_cursor_default block
set fish_cursor_insert block
set fish_cursor_replace_one block
set fish_cursor_visual block
