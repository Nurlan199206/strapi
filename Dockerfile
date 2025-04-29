FROM node:21-slim

RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    gcc \
    libc6-dev \
    libvips-dev \
    sqlite3 \
    libsqlite3-dev \
    git \
    curl \
    bash \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /opt/app

COPY . .

RUN yarn install

RUN yarn build

EXPOSE 1337

CMD ["yarn", "dev"]
