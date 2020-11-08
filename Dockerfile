FROM	php:7.3.11-apache-buster

# https://getcomposer.org/doc/03-cli.md#composer-allow-superuser
ENV COMPOSER_ALLOW_SUPERUSER 1

# Install openssl, git and unzip
RUN apt-get update && apt-get install -y \
    openssl \
    git \
    unzip \
 # Install Composer
 && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
 && composer --version
RUN	git clone https://github.com/jikan-me/jikan-rest.git . \
  && composer require 'composer/package-versions-deprecated' \
	&& composer install --prefer-dist --no-progress --classmap-authoritative  --no-interaction \
	&& composer update jikan-me/jikan

ADD	.env	/run-jikan.sh	./
ENTRYPOINT	["./run-jikan.sh"]

