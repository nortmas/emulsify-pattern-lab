FROM node:12.18.0-buster
MAINTAINER Dmitry Antonenko <raerayan@gmail.com>

RUN echo "deb http://security.debian.org/ jessie/updates main" | tee /etc/apt/sources.list && \
    echo "deb-src http://security.debian.org/ jessie/updates main" | tee /etc/apt/sources.list && \
    echo "deb http://security.debian.org/ jessie/updates main contrib non-free" | tee /etc/apt/sources.list && \
    echo "deb-src http://security.debian.org/ jessie/updates main contrib non-free" | tee /etc/apt/sources.list && \
    echo "deb http://http.us.debian.org/debian jessie main contrib non-free" | tee /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y php5-dev apt-transport-https && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn && \
    apt-get clean && \
    rm -rf \
      /root/.composer \
      /tmp/* \
      /usr/include/php \
      /usr/lib/php5/build \
      /var/lib/apt/lists/*

EXPOSE 3000 3001

USER node

CMD ["node"]
