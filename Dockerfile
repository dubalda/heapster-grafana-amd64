FROM k8s.gcr.io/heapster-grafana-amd64:v4.4.3

COPY devopsprodigy-kubegraf-v1.3.0-0-g6617875.zip /var/lib/grafana/plugins

RUN cp /var/lib/grafana/plugins/ && \
    bunzip2 devopsprodigy-kubegraf-v1.3.0-0-g6617875.zip
