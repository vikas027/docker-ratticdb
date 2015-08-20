#!/bin/bash

rm -rf /run/apache2/*

source /etc/apache2/envvars
exec apache2 -D FOREGROUND
