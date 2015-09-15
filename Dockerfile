# Composer image
# Runs composer within a container
FROM nmcteam/php56
MAINTAINER luiscon26@gmail.com

ENV HOME /root

# Install Git and Curl
RUN apt-get update -qq && \
    apt-get install -y -qq git && \
    apt-get -y clean

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin

WORKDIR /srv