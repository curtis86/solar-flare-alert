# Project variables and constants go here

# CONSTANTS
readonly project_name="solar-flare-alert"
readonly project_version="1.0"
readonly data_dir="${home_dir}/data"
readonly flare_data="${data_dir}/latest-xray-event.json"
readonly last_event_hash_file="${data_dir}/last_event.md5" ; [ ! -d "${last_event_hash_file}" ] && touch "${last_event_hash_file}"
readonly md5_bin_name="md5sum"
readonly dependencies=( "wget" "${md5_bin_name}" "mail" "jq" "mail" )
readonly email_to_notify=( "your_email_address_here" )
min_class_to_alert="A1" ; readonly min_class_to_alert="$( echo "${min_class_to_alert}" | tr '[a-z]' '[A-Z]' )"
readonly class_grep_string="A|B|C|M|X"

readonly A_score="10"
readonly B_score="20"
readonly C_score="30"
readonly M_score="50"
readonly X_score="100"
