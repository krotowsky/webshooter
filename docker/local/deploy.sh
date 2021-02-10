#!/bin/bash

docker build -t kazar-project_name/php:7-fpm ../images/php:7-fpm
cp .env.local.dist ../../.env
docker-compose -f stack.yml up -d
