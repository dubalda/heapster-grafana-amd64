#!/bin/sh

# Allow access to dashboards without having to log in
# Export these variables so grafana picks them up
export GF_AUTH_ANONYMOUS_ENABLED=${GF_AUTH_ANONYMOUS_ENABLED:-true}
export GF_SERVER_PROTOCOL=${GF_SERVER_PROTOCOL:-http}

echo "Starting a utility program that will configure Grafana"
setup_grafana >/dev/stdout 2>/dev/stderr &

if [ ! -f /etc/grafana/grafana.ini ]; then
        touch /etc/grafana/grafana.ini
fi

mkdir -p /var/lib/grafana/plugins
unzip -q devopsprodigy-kubegraf-v1.3.0-0-g6617875.zip -d /var/lib/grafana/plugins/
unzip -q grafana-piechart-panel-v1.5.0-0-g3234d63.zip -d /var/lib/grafana/plugins/
ls /var/lib/grafana/plugins/

echo "Starting Grafana in foreground mode"
exec /usr/sbin/grafana-server \
  --homepath=/usr/share/grafana \
  --config=/etc/grafana/grafana.ini \
  cfg:default.log.mode="console" \
  cfg:default.paths.data=/var/lib/grafana \
  cfg:default.paths.logs=/var/log/grafana
