#!/bin/bash
set -ex

# Copy in the base theme
mkdir -p /root/.fluxbox
cp -r /config/.fluxbox/* /root/.fluxbox

# Mark Fluxbox startup as executable
chmod +x /root/.fluxbox/startup

# Bring in the stylesheets (defaults to WindowLab)
THEME=${THEME:="WindowLab"}
if [ "$THEME" ]; then 
  mkdir -p /root/.fluxbox/styles
  cp -r "/config/themes/$THEME"/* /root/.fluxbox/styles
  cp /root/.fluxbox/styles/bg.png /root/.fluxbox/bg.png
fi

# Bring in dot files
cp /config/.bashrc /root/.bashrc
cp /config/.Xdefaults /root/.Xdefaults

# Mark .bashrc as executable
chmod +x /root/.bashrc

exec supervisord -c /supervisord.conf
