#!/bin/bash

set -e

# Check if running in GitHub vs locally
if [ -n "$GITHUB_ACTIONS" ]
then
  echo "** Running github action script **"
        apt-get update
        apt-get clean
        apt-get install -y wget
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
        sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
        apt-get install -y apt-transport-https
        apt-get update
        apt-get install -y code
  echo "** **"
fi