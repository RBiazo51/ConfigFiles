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

alias whatismyspeed='echo (set_color cyan)Testing Internet Speed Now(set_color reset);speedtest --secure | grep Mbit/s'

function whatismydisk
    echo (set_color cyan)Zeros(set_color normal)
    dd if=/dev/zero of=/tmp/test1.img bs=1G count=1 oflag=dsync
    rm /tmp/test1.img

    echo (set_color cyan)Random(set_color normal)
    dd if=/dev/random of=/tmp/test2.img bs=1G count=1 oflag=dsync
    rm /tmp/test2.img
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
		printf  "%-8s" (set_color br$i)██ br$i                                                                                                                                             
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
