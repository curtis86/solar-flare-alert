# TRAPS
trap force_exit INT KILL
force_exit() { msg "${t_bold}${t_yellow}WARNING:${t_normal}: trap caught. Exiting." ; exit ;}

# FORMATTING
t_bold=$( tput bold )
t_normal=$( tput sgr0 )
t_red=$( tput setaf 1 )
t_yellow=$( tput setaf 3 )
t_green=$( tput setaf 2 )

# SCRIPT FUNCTIONS
abrt() { echo -e "${t_bold}${t_red}FATAL:${t_normal} $@ - exiting." 1>&2 ; exit 1 ;}
msg() { echo "$@" ;}
test_access() { test_target="$1" ; [ ! -w "${test_target}" ] && abrt "Unable to access ${t_yellow}${test_target}${t_normal}" ;}
