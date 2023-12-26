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
#Uncomment depending on OS
#Arch
#alias reflect="sudo reflector --country 'United States',Canada --age 24 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
#Debian/Ubuntu
#alias reflect="sudo nala fetch"
alias tweather="curl 'v2.wttr.in/tontitown?u'"
alias fweather="curl 'v2.wttr.in/fayetteville?u'"
alias whatismydisk='echo (set_color cyan)Zeros(set_color reset);dd if=/dev/zero of=/tmp/test1.img bs=1G count=1 oflag=dsync;rm /tmp/test1.img;echo (set_color cyan)Random(set_color reset);dd if=/dev/random of=/tmp/test2.img bs=1G count=1 oflag=dsync;rm /tmp/test2.img'
alias whatismyspeed='echo (set_color cyan)Testing Internet Speed Now(set_color reset);speedtest --secure | grep Mbit/s'

function whatismycolor
    for i in BLACK brBLACK BLUE brBLUE GREEN brGREEN YELLOW brYELLOW CYAN brCYAN WHITE brWHITE MAGENTA brMAGENTA RED brRED NORMAL
        echo (set_color $i)$i
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
