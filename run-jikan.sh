#!/usr/bin/env bash
# allow write permission
chmod -R a+w storage/

# php:7.3.2-apache-stretch ENTRYPOINT
php -S 0.0.0.0:9000 -t public
