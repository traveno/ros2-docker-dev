#!/bin/bash
set -ex

if [ "$THEME" ]; then 
  mkdir -p /root/.fluxbox/styles
  cp -r "/root/.fluxbox-themes/$THEME"/* /root/.fluxbox/styles
  mv /root/.fluxbox/styles/bg.png /root/.fluxbox/bg.png
fi

exec supervisord -c /supervisord.conf
