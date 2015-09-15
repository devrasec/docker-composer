# Composer image
# Runs composer within a container
# Thanks to François Zaninotto and Simon Dittlmann
FROM ubuntu:14.04
MAINTAINER luiscon26@gmail.com

ENV HOME /root

# Install Git and Curl
RUN apt-get update -qq && \
    apt-get install -y -qq git curl && \
    apt-get -y clean

# Install HHVM
RUN curl -s http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add - && \
    echo deb http://dl.hhvm.com/ubuntu trusty main | tee /etc/apt/sources.list.d/hhvm.list && \
    apt-get update -qq && \
    apt-get install -y -qq hhvm && \
    apt-get -y clean

RUN echo "date.timezone = US/Eastern" >> /etc/hhvm/php.ini

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin

WORKDIR /srv