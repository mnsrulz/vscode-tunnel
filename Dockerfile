FROM mcr.microsoft.com/devcontainers/javascript-node

RUN curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' --output vscode_cli.tar.gz 
RUN tar -xvf vscode_cli.tar.gz && rm -f vscode_cli.tar.gz
# change permission of file to execute
RUN chmod +x ./code
