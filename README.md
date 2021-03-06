# helmfiles

## install

```bash
brew install kubernetes-cli
brew install helm
brew install helmfile

pip install --upgrade --user awscli

helm plugin install https://github.com/databus23/helm-diff --version master
```

## helmfile apply

```bash
helmfile -e eks-demo apply

helmfile -f helmfile-all.yaml -e eks-demo apply

helmfile -f helmfile-argo.yaml -e eks-demo apply
helmfile -f helmfile-default.yaml -e eks-demo apply
helmfile -f helmfile-devops.yaml -e eks-demo apply
helmfile -f helmfile-elastic.yaml -e eks-demo apply
helmfile -f helmfile-keycloak.yaml -e eks-demo apply
helmfile -f helmfile-kube-ingress.yaml -e eks-demo apply
helmfile -f helmfile-kube-system.yaml -e eks-demo apply
helmfile -f helmfile-monitor.yaml -e eks-demo apply
helmfile -f helmfile-vault.yaml -e eks-demo apply

# helmfile -f helmfile-all.yaml -e eks-demo destroy
```

* <https://github.com/roboll/helmfile/>
