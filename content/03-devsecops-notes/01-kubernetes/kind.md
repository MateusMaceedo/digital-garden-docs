---
title: "Kind"
weight: 3
---

---

### Instalando

```shell
#-----------------------------------------------------------------------------------------------
## Kind
## link: https://kind.sigs.k8s.io/docs/user/quick-start/#installation
##  Usado para criar cluter kubernets

curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.16.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# Cria aum cluter
kind create cluster

# cria com nome
kind create cluster --name uni-cluster

# cria cluster via arquivo <ver abaixo arquivo cluster king>
kind create cluster --config=config.yaml

# Listar os cluster
kind get clusters

# Delete lcluster
kind delete cluster -n <name>

#-----------------------------------------------------------------------------------------------
# Listando contextos possiveis
cat ~/.kube/config 
kubcetl config get-cluster

# setar um contexto
kubectl cluster-info --context <contexto>
kubcetl config use-context <contexto>

# Setando o Kind como cluster padrão no kubctl
kubectl cluster-info --context kind-kind
kubcetl config use-context kind-kind

# Setando o minikube como cluster padrão no kubctl
kubectl cluster-info --context  minikube

# Setar namespace padrão
kubectl config set-context --current --namespace=<namespace>
```

---

### Criando cluster via arquivo

- Crie o arquivo config.yaml - [kind – Configuration](https://kind.sigs.k8s.io/docs/user/configuration/))

```yaml
kind: Pod
apiVersion: v1
metadata:
  name: foo
  labels:
    app: foo
spec:
  containers:
  - name: foo
    image: hashicorp/http-echo:0.2.3
    args:
    - "-text=foo"
    ports:
    - containerPort: 5678
---
apiVersion: v1
kind: Service
metadata:
  name: foo
spec:
  type: NodePort
  ports:
  - name: http
    nodePort: 30950
    port: 5678
  selector:
    app: foo

```

- Execute o comando

```shell
kind create cluster --config=config.yaml
```
