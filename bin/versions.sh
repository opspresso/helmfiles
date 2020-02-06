#!/bin/bash

LIST=/tmp/helm-list

# installed chart version
helm list | awk '{print $1" "$9}' > ${LIST}

cat ${LIST} | awk '{print $2}'
echo

# helm 3
# URL="https://hub.helm.sh/charts/${REPO}"
# LATEST=$(helm search hub ${NAME} -o json | URL="${URL}" jq -r '[.[] | select(.url==env.URL)][0] | "\(.version)"')

while read VAR; do
    ARR=(${VAR})

    REPO=${ARR[0]}

    helm search ${REPO} -o json | REPO="${REPO}" jq -r '[.[] | select(.Name==env.REPO)][0] | "\(.Version)"'

done < ${LIST}
