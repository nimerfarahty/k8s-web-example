

# install ingress on digitaloeacn 
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.41.2/deploy/static/provider/do/deploy.yaml


# install cert manager on digitalocean
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.1.0/cert-manager.yaml


# change docker image from remote regitry 
kubectl set image deployment.apps/node-dep web-server=nimerfarahat/webserver:latest --record


# deploy script 
docker build -t nimerfarahat/webserver:latest .
docker push nimerfarahat/webserver
kube rollout restart deployment.apps/node-dep


# create docker regitry secret 
kubectl create secret docker-registry regcred --docker-server=https://index.docker.io/v1/ --docker-username=nimerfarahat --docker-password=<> --docker-email=<>


kubectl create secret docker-registry canister --docker-server=cloud.canister.io:5000 --docker-username=farahty --docker-password=<> --docker-email=<>