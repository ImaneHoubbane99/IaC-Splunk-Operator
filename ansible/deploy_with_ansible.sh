docker build -t ansible-aks-setup .
docker run --env-file=.env -v $HOME/.kube/config:/root/.kube/config ansible-aks-setup $1
