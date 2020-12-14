#!/bin/bash

. $HOME/.config/dotfiles/default-browser.conf

browser="$PERSONAL_BROWSER"

activity=$(qdbus org.kde.ActivityManager /ActivityManager/Activities CurrentActivity)
is_personal_url=0

for site in ${PERSONAL_SITES[@]}
do
  if [[ "$*" =~ $site ]]
  then
    is_personal_url=1
  fi
done

if [ $is_personal_url -eq 0 ] && [ $WORK_ACTIVITY = $activity ]
then
  browser="$WORK_BROWSER"
fi

exec "$browser" "$@"

