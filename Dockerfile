FROM k8s.gcr.io/heapster-grafana-amd64:v4.4.3

COPY run.sh /
COPY devopsprodigy-kubegraf-v1.3.0-0-g6617875.zip /
COPY grafana-piechart-panel-v1.5.0-0-g3234d63.zip /
