#!/bin/sh

mkdir -p /var/hazel

hazel -c /var/hazel/config.toml -l /var/log/hazel.log -p 80 -d ${POSTGRES_URL} -s ${STORAGE_PATH}
