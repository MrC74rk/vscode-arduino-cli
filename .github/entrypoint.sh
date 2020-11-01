#!/bin/bash

set -e

# Check if running in GitHub vs locally
if [ -n "$GITHUB_ACTIONS" ]
then
 
  echo "** Installing VSCode Test Package **"
  #code --user-data-dir="~/.vscode-root" #---So we can run as root
  code --install-extension /github/workspace/vscode-arduino-cli-0.0.2.vsix

  echo "** Executing Test **"
  mocha ./src/test/runTest.ts

  echo "** END TEST **"

  echo "** Starting Cleanup **"
fi
