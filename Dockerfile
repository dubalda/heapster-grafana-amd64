FROM k8s.gcr.io/heapster-grafana-amd64:v4.4.3

RUN grafana-cli plugins install devopsprodigy-kubegraf-app
