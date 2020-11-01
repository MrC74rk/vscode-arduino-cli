#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------
#
# To fully customize the contents of this image, use the following Dockerfile instead:
# https://github.com/microsoft/vscode-dev-containers/tree/v0.122.1/containers/javascript-node-14/.devcontainer/Dockerfile
FROM node:14

USER node
#
#
#
COPY entrypoint.sh /entrypoint.sh
RUN ["bin/bash" "-c" 'sudo chmod +x entrypoint.sh" 
#
ENTRYPOINT ["/entrypoint.sh"]