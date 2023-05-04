# argocd

# minikube
```sh
minikube start --kubernetes-version=v1.26.1 --driver=docker
````

# ArgoCD

```sh
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
````

```sh
kubectl port-forward svc/argocd-server -n argocd 8080:443
````


```sh
docker pull nginx:1.23.4
````

```sh
docker tag nginx:1.23.4 arturix/nginx:v0.1.0
````
