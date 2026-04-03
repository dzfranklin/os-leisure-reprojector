#!/bin/bash
set -euo pipefail

# Inject environment variables into MapProxy config
sed "s|{{OS_API_KEY}}|${OS_API_KEY}|g" /mapproxy/mapproxy_template.yaml > /mapproxy/mapproxy.yaml

exec "$@"
