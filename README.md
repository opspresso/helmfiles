# helmfiles

## install

```bash
brew install kubernetes-cli
brew install helm
brew install helmfile

pip install --upgrade --user awscli

helm plugin install https://github.com/databus23/helm-diff --version master
```

## helm init

```bash
bash ./bin/helm_init.sh
```

## helmfile apply

```bash
helmfile -e eks-demo apply

helmfile -f helmfile-all.yaml -e eks-demo apply
helmfile -f helmfile-argo.yaml -e eks-demo apply
helmfile -f helmfile-devops.yaml -e eks-demo apply
helmfile -f helmfile-keycloak.yaml -e eks-demo apply
helmfile -f helmfile-monitor.yaml -e eks-demo apply
```

* <https://github.com/roboll/helmfile/>
