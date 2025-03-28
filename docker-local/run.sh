#!/usr/bin/env bash

cp -r ./docker-compose.yml ../../

ORIGIN=$(pwd)
cd ../../
ROOT=$(pwd)

docker-compose -p rest-based -f docker-compose.yml stop rest-based-solution

cd "$ROOT"/rest-based-solution
mvn -T 1C clean install -DskipTests=true

cd "$ROOT"/
docker-compose -p rest-based -f docker-compose.yml up --build -d --no-deps rest-based-solution

cd "$ORIGIN"