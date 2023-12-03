#!/bin/bash
# docker-entry.sh

set -eu

# Append our .bashrc to Docker's .bashrc
touch /root/.bashrc
echo "source /root/.bashrc-external" >> /root/.bashrc

exec "$@"