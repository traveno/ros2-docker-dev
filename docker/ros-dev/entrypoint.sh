#!/bin/bash
set -eu

# Append our .bashrc to Docker's .bashrc
touch /root/.bashrc
echo "source /config/.bashrc" >> /root/.bashrc

# Bring in the tmux config
cp /config/.tmux.conf /root/.tmux.conf

exec "$@"