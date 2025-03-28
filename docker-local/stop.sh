#!/usr/bin/env bash

ORIGIN=$(pwd)
cd ../../

docker-compose -f docker-compose.yml down
cd "$ORIGIN"