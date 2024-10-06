docker build -t ansible-aks-setup .
docker run -v $HOME/.kube/config:/root/.kube/config ansible-aks-setup $1