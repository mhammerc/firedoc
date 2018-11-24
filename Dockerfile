FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y && apt-get install -y boinc build-essential curl gnupg vim

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash

RUN apt-get update && apt-get install -y nodejs

RUN npm i -g serve