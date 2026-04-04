#!/bin/bash
# From <https://github.com/kartoza/docker-mapproxy/blob/master/scripts/start.sh>
set -eo pipefail

source /scripts/env-data.sh

mkdir -p "${MAPPROXY_APP_DIR}"

mapproxy-util create -t wsgi-app -f /mapproxy/mapproxy.yaml "${MAPPROXY_APP_DIR}"/app.py

uwsgi_config /mapproxy

exec uwsgi --ini /settings/uwsgi.ini
