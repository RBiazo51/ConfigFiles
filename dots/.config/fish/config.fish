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
alias whatismyip="curl icanhazip.com"
alias whatismydisk='echo (set_color cyan)Zeros(set_color reset);dd if=/dev/zero of=/tmp/test1.img bs=1G count=1 oflag=dsync;rm /tmp/test1.img;echo (set_color cyan)Random(set_color reset);dd if=/dev/random of=/tmp/test2.img bs=1G count=1 oflag=dsync;rm /tmp/test2.img'
alias whatismyspeed='echo (set_color cyan)Testing Speed Now(set_color reset);speedtest --secure | grep Mbit/s'

set fish_cursor_default block
set fish_cursor_insert block
set fish_cursor_replace_one block
set fish_cursor_visual block
