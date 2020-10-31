#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------
#
# To fully customize the contents of this image, use the following Dockerfile instead:
# https://github.com/microsoft/vscode-dev-containers/tree/v0.122.1/containers/javascript-node-14/.devcontainer/Dockerfile
FROM node:14
#
#
# The node image includes a non-root user with sudo access. Use the "remoteUser"
# property in devcontainer.json to use it. On Linux, the container user's GID/UIDs
# will be updated to match your local UID/GID (when using the dockerFile property).
# See https://aka.ms/vscode-remote/containers/non-root-user for details.
#
ARG USERNAME=node
ARG USER_UID=1000
ARG USER_GID=$USER_UID
#
ARG NPM_GLOBAL=/usr/local/share/npm-global
ENV PATH=${PATH}:${NPM_GLOBAL}/bin
ENV NVM_DIR=/usr/local/share/nvm
#
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh \
    && sudo ./entrypoint.sh \
    && code --user-data-dir="~/.vscode-root" #---So we can run as root \
    && code --install-extension /github/workspace/vscode-arduino-cli-0.0.2.vsix
#
#ENTRYPOINT ["/entrypoint.sh"]