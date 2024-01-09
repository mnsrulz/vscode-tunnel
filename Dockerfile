FROM ubuntu

RUN apt-get update && apt-get upgrade -y

RUN apt-get -y install curl

RUN curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' --output vscode_cli.tar.gz
RUN tar -xvf vscode_cli.tar.gz
RUN chmod +x ./code

# how to execute under sudo in docker image
RUN apt-get install wget gpg -y
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
RUN mv packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
RUN echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list

RUN apt-get install apt-transport-https -y
RUN apt-get update -y
RUN apt-get install code -y