#!/bin/bash

# TODO make this configurable
work_activity="3d2c2c5c-a7f3-42c8-ad36-1cdfb114d457"

personal_sites=('https://www.facebook.com/*')

activity=$(qdbus org.kde.ActivityManager /ActivityManager/Activities CurrentActivity)
browser=/usr/bin/firefox
is_personal_url=0

for site in $personal_sites
do
  if [[ "$*" == $site ]]
  then
    is_personal_url=1
  fi
done

if [ $is_personal_url -eq 0 ] && [ $work_activity = $activity ]
then
  browser=/usr/bin/firefox-developer-edition
fi

exec "$browser" "$@"

