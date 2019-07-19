#!/bin/bash

# ~/bin/dwm-statusbar
# Adapted from w0ng status bar: https://github.com/w0ng/bin
# Adapted from jasonwryan status bar: https://bitbucket.org/jasonwryan/shiv/src/1ad5950c3108a4e5a9dcb78888a1ccfeb9252b45/Scripts/dwm-status?at=default

#---separator                              
sp="$(echo -ne "${color0} ")" 
sp1="$(echo -ne "${color0} | ")" 
sp2="$(echo -ne "${color0}|")"
sp3="$(echo -ne "${color0}|")"

print_torrent() {
	torrent="$(transmission-remote -l | awk '/Sum:/ {print "DL"" "$5 " " "UP"" "$4}')"
  	echo -ne "${torrent}"
}


print_memory() {
	memory="$(free -h | awk '/Mem:/ {print $3}')"
  	echo -ne "Mem ${memory}"
}

#
#print_IP() {
#	IP="$(ip a | awk '/inet / {print $2}' | sed "s/127.0.0.1.*//g; /^$/ d")"
#  	echo -ne "IP ${IP}"
#}
#

print_sensor() {
	sensor="$(sensors | awk '/Package id 0:/ {print $4}')"
  	echo -ne "Temp ${sensor}"
}

print_hddfree() {
  hddfree="$(df -Ph /dev/sda1 | awk '$3 ~ /[0-9]+/ {print $4}')"
  echo -ne "SSD ${hddfree}"
}

print_fan() {
	fan="$(sensors | awk '/fan1:/ {print $2}')"
  	echo -ne "FAN ${fan}"
}


 print_volume(){
    mix=`amixer get Master | tail -1`
    vol="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
    if [[ $mix == *\[off\]* ]]; then
      #red 2                                                
      echo -e " OFF"
    elif [[ $mix == *\[on\]* ]]; then
      #green 9
      echo -e "Vol ${vol}%"
    else
      #yellow6
      echo -e "Vol ---"
    fi
 }


print_datetime() {
  datetime="$(date "+%a %d %b %I:%M")"
  echo -ne "${datetime}"
}

while true; do
  # get new cpu idle and total usage
  eval $(awk '/^cpu /{print "cpu_idle_now=" $5 "; cpu_total_now=" $2+$3+$4+$5 }' /proc/stat)
  cpu_interval=$((cpu_total_now-${cpu_total_old:-0}))
  # calculate cpu usage (%)
  let cpu_used="100 * ($cpu_interval - ($cpu_idle_now-${cpu_idle_old:-0})) / $cpu_interval"

  # output vars
print_cpu_used() {
  printf "%-1b" "CPU ${cpu_used}%"
#"%-10b" "${color7}CPU:${cpu_used}%"
}
 
  # Pipe to status bar, not indented due to printing extra spaces/tabs
  #xsetroot -name "$(print_power)${sp1}$(print_wifiqual)$(print_hddfree)${sp1}$(print_email_count)$(print_pacup)$(print_aurups)$(print_aurphans)${sp2}$(print_volume)${sp2}$(print_datetime)"
  xsetroot -name "$(print_torrent)${sp1}$(print_cpu_used)${sp1}$(print_fan)${sp1}$(print_sensor)${sp1}$(print_hddfree)${sp1}$(print_memory)${sp1}$(print_volume)${sp1}$(print_datetime)"
  #xsetroot -name "$(print_song_info)$(print_power)${sp1}$(print_wifiqual)$(print_hddfree)${sp2}$(print_volume)${sp2}$(print_datetime)"

  # reset old rates
  cpu_idle_old=$cpu_idle_now
  cpu_total_old=$cpu_total_now
  # loop stats every 1 second
  sleep 3 
 done
