#!/bin/bash

REPO=${1}

if [ -z "${REPO}" ]; then
    exit 0
fi

NAME=$(echo $REPO | cut -d'/' -f2)

# installed chart version
VERSION=$(helm list | grep "${NAME}" | head -1 | awk '{print $9}')

if [ "${VERSION}" != "" ]; then
    printf '# %-20s : %-25s \n' "installed version" "${VERSION}"
fi

# helm 3
# URL="https://hub.helm.sh/charts/${REPO}"
# LATEST=$(helm search hub ${NAME} -o json | URL="${URL}" jq -r '[.[] | select(.url==env.URL)][0] | "\(.version)"')

LATEST=$(helm search ${REPO} -o json | REPO="${REPO}" jq -r '[.[] | select(.Name==env.REPO)][0] | "\(.Version)"')

if [ "${VERSION}" != "" ]; then
    printf '# %-20s : %-25s \n' "latest chart version" "${NAME}-${LATEST}"
fi
