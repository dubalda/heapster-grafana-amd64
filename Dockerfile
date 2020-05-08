FROM k8s.gcr.io/heapster-grafana-amd64:v4.4.3

RUN mkdir -p /var/lib/grafana/plugins

COPY devopsprodigy-kubegraf-v1.3.0-0-g6617875.zip /var/lib/grafana/plugins/

WORKDIR /var/lib/grafana/plugins/

RUN cd /var/lib/grafana/plugins/ && \
    bunzip2 devopsprodigy-kubegraf-v1.3.0-0-g6617875.zip && \
    cd /
