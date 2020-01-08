# helmfiles

## install

```bash
brew install kubernetes-cli
brew install helm
brew install helmfile

pip install --upgrade --user awscli
```

## helm init

```bash
bash ./bin/helm_init.sh
```

## set env

```bash
. ./env-demo.sh
```

## helmfile sync

```bash
helmfile sync

helmfile -f helmfile-argo.yaml sync
helmfile -f helmfile-devops.yaml sync
helmfile -f helmfile-monitor.yaml sync
```
