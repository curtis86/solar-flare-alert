check_dependencies() {
  for dependency in "${dependencies[@]}" ; do
    if ! which ${dependency} >/dev/null 2>&1 ; then
      abrt "unable to find dependency ${dependency}"
    fi
  done
}

update_flare_data() {
  msg "Updating JSON data..."
  cd "${data_dir}" && wget -q -N http://services.swpc.noaa.gov/products/latest-xray-event.json
  [ $? -ne 0 ] && abrt "Unable to retreive latest xray event data."
}

send_mail_alert() {
  local subject='Solar flare alert!'
  local alert_message="A ${last_flare_event_class}${last_flare_event_scale} class solar flare occurred at ${last_flare_event_time} UTC."
  [ -z "${email_to_notify}" ] && abrt "No mail recipients specified"

  for email_address in "${email_to_notify[@]}" ; do
    echo "${alert_message}" | mail -s "${subject}" "${email_address}"
  done
}

flare_classification_score() {
  local flare_class="$1" ; [ -z "${flare_class}" ] && abrt "No flare classification specified"
  local flare_scale="$2" ; [ -z "${flare_scale}" ] && flare_scale=1
  local flare_score=0

  # Not checking if flare class is valid... yet
  case ${flare_class} in
    "A") flare_score=$( echo "scale=2; ${A_score} + ${flare_scale}" | bc ) ;;
    "B") flare_score=$( echo "scale=2; ${B_score} + ${flare_scale}" | bc ) ;;
    "C") flare_score=$( echo "scale=2; ${C_score} + ${flare_scale}" | bc ) ;;
    "M") flare_score=$( echo "scale=2; ${M_score} + ${flare_scale}" | bc ) ;;
    "X") flare_score=$( echo "scale=2; ${X_score} + ${flare_scale}" | bc ) ;;
  esac

  echo "${flare_score}"

}
