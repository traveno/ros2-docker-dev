#!/bin/bash
# docker-entry.sh

set -eu

# Append .bashrc to Docker's .bashrc
touch /root/.bashrc
echo "source /root/.bashrc-external" >> /root/.bashrc

exec "$@"