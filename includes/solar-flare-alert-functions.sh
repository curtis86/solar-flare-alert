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
}

send_mail_alert() {
  local subject='Solar flare alert!'
  local alert_message="A ${last_flare_event_class}${last_flare_event_scale} class solar flare occurred at ${last_flare_event_time} UTC."
  [ -z "${email_to_notify}" ] && abrt "No mail recipients specified"

  for email_address in "${email_to_notify[@]}" ; do
    echo "${alert_message}" | mail -s "${subject}" "${email_address}"
  done
}
