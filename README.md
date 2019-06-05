# kube-cron-go

simple proof-of-concept cron job written in go for kubernetes.

## Running with `minikube`

Let's reuse the Docker daemon from Minikube (so we can use local docker images).

```sh
eval $(minikube docker-env)
```

Now build and tag the image.

```sh
docker build . -t kube-cron-go
```

And create the Cron Job.

```sh
kubectl create -f cronjob.yaml
```
