#!/bin/bash

set -e

# Check if running in GitHub vs locally
if [ -n "$GITHUB_ACTIONS" ]
then
  echo "** Running github action script **"
        apt-get update
        apt-get clean
        #Install Wget
        apt-get install -y wget
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
        sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
        apt-get install -y apt-transport-https
        apt-get update
        apt-get install -y code
        
        #Add microsoft repos and update for Dotnet-SDK and update APT
        wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
        dpkg -i packages-microsoft-prod.deb
        apt-get update
        
        apt-get install -y dotnet-sdk-3.1        
        # dotnet --list-sdks    (line to insure SDK was installed Troubleshooting)    
        
        apt-get install -y nodejs #installs node.js
        
        
  echo "** Docker Environment Ready **"  #mark end of docker setup

  echo "** Building VISX **"
  npm install --global vsce
  npm install --global gulp
  npm i
  gulp package

  echo "** Installing VSCode Test Package **"
  #code --install-extension (<extension-vsix-path>)

  echo "** Executing Test **"
  mocha ./src/test/runTest.ts

  echo "** END TEST **"

  echo "** Starting Cleanup **"
fi
