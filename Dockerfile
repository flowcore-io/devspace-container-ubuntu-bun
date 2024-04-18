FROM ubuntu

WORKDIR /tmp

RUN apt-get update && apt-get install -y curl unzip

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
RUN . ~/.nvm/nvm.sh &&\
    nvm install v18.18.0

RUN curl -fsSL https://bun.sh/install | bash

ENV PATH="/root/.bun/bin:${PATH}"

RUN bun --version

WORKDIR /app

RUN . ~/.nvm/nvm.sh &&\
    npm install -y typescript tsc-watch