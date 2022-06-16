# How to debug golang using delve

## remote-debugging

### Docker

![remote-debuggng-settings](./images/remote-debuggng-settings.png)

### Kubernetes

```bash

kubectl create ns debug
kubectl apply -f golang-debug-for-k8s.yaml -n debug

```

![kubeforwarder_settings](./images/kubeforwarder_settings.png)
