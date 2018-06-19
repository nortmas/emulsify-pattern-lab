FROM node:7.1
MAINTAINER Dmitry Antonenko <raerayan@gmail.com>

RUN apt-get update && \
    apt-get install -y php5-dev && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    
    # Install yarn
    apt-get update && apt-get install -y curl apt-transport-https && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn \

    # Clean up.
    apt-get clean && \
    rm -rf \
      /root/.composer \
      /tmp/* \
      /usr/include/php \
      /usr/lib/php5/build \
      /var/lib/apt/lists/*

EXPOSE 3001 3050
