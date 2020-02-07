#!/bin/bash

LIST=/tmp/helm-list

# installed chart version
cat releases/* | grep ' chart: ' | awk '{print $2}' > ${LIST}

cat ${LIST}

# helm 3
# URL="https://hub.helm.sh/charts/${REPO}"
# LATEST=$(helm search hub ${NAME} -o json | URL="${URL}" jq -r '[.[] | select(.url==env.URL)][0] | "\(.version)"')

while read REPO; do

    echo
    helm search ${REPO} -o json | REPO="${REPO}" jq -r '[.[] | select(.Name==env.REPO)][0] | "\(.Version)"'

    # helm search ${REPO} | grep "\/${REPO}"

done < ${LIST}
