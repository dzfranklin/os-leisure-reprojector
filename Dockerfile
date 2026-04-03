FROM docker.io/kartoza/mapproxy:6.0.1--v2025.12.01

# Avoid cluttering logs with ascii art printed by kartoza/mapproxy
RUN printf '#!/bin/sh\ntrue'>/usr/bin/figlet

RUN python3 -c "from pyproj.transformer import TransformerGroup; \
    tg = TransformerGroup('EPSG:27700', 'EPSG:3857', always_xy=True); \
    tg.download_grids(verbose=True);"

COPY mapproxy_template.yaml /mapproxy/mapproxy_template.yaml
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT [ "/entrypoint.sh"]
CMD [ "/scripts/start.sh" ]
