FROM k8s.gcr.io/heapster-grafana-amd64:v4.4.3

RUN apt-get update && \
    apt-get install --no-install-recommends -y ca-certificates && \
    grafana-cli plugins install devopsprodigy-kubegraf-app && \
    rm -rf /var/lib/apt/lists/*
