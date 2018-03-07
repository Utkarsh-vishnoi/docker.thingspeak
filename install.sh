#!/bin/sh
docker-compose up -d --build
docker-compose run --rm web rake db:create
docker-compose run --rm web rake db:schema:load
