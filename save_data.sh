#!/usr/bin/env bash

pgsql2shp -f output/dots.shp quito
psql quito -F , --no-align -c "SELECT * FROM dots;" > output/dots.csv