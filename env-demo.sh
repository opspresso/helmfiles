#!/bin/bash

# common
export AWS_REGION="ap-northeast-2"

export CLUSTER_NAME="seoul-dev-demo-eks"

export ROOT_DOMAIN="mzdev.be"
export BASE_DOMAIN="demo.${ROOT_DOMAIN}"

# kube-ingress
export CERT_MANAGER_INSTALLED="true"
export CERT_MANAGER_RBAC_ENABLED="true"
export CERT_MANAGER_ISSUER_EMAIL="me@nalbam.com"

export NGINX_INGRESS_INSTALLED="true"
export NGINX_INGRESS_CONTROLLER_KIND="DaemonSet"

# kube-system
export KUBE2IAM_INSTALLED="true"

export METRICS_SERVER_INSTALLED="true"

export KUBE_STATE_METRICS_INSTALLED="true"

export CLUSTER_AUTOSCALER_INSTALLED="true"
export CLUSTER_AUTOSCALER_IAM_ROLE="${CLUSTER_NAME}-autoscaling"

export CLUSTER_OVERPROVISIONER_INSTALLED="true"

export EFS_PROVISIONER_INSTALLED="true"
export EFS_PROVISIONER_IAM_ROLE="${CLUSTER_NAME}-efs"
export EFS_FILE_SYSTEM_ID="$(aws efs describe-file-systems --creation-token ${CLUSTER_NAME} --region ${AWS_REGION} | jq -r '.FileSystems[].FileSystemId')"

# monitor
export PROMETHEUS_INSTALLED="true"

export GRAFANA_INSTALLED="true"
export GRAFANA_HOST="grafana.${BASE_DOMAIN}"

# argo
export ARGO_INSTALLED="true"
export ARGO_INGRESS_HOST="argo.${BASE_DOMAIN}"
export ARGO_IAM_ROLE="${CLUSTER_NAME}-argo"
export ARGO_BUCKET="${CLUSTER_NAME}-argo"

export ARGO_CD_INSTALLED="true"
export ARGO_CD_INGRESS_HOST="argocd.${BASE_DOMAIN}"
export ARGO_CD_PASSWORD='$2a$10$RihNM/bmql87aKhSa/U0DOmTx5JDPl2byap07bLSNRtsEXFiq87E2'

export ARGO_EVENTS_INSTALLED="true"

export ARGO_ROLLOUTS_INSTALLED="true"

# devops
export CHARTMUSEUM_INSTALLED="true"
export CHARTMUSEUM_IAM_ROLE="${CLUSTER_NAME}-chartmuseum"
export CHARTMUSEUM_DEBUG="true"
export CHARTMUSEUM_DISABLE_API="false"
export CHARTMUSEUM_ALLOW_OVERWRITE="false"
export CHARTMUSEUM_STORAGE_AMAZON_BUCKET="${CLUSTER_NAME}-chartmuseum"
export CHARTMUSEUM_STORAGE_AMAZON_PREFIX="/"
export CHARTMUSEUM_STORAGE_AMAZON_REGION="${AWS_REGION}"
# export CHARTMUSEUM_BASIC_AUTH_USER="server"
# export CHARTMUSEUM_BASIC_AUTH_PASS="924426A5-DA22-4A10-9FB1-418761684372"
export CHARTMUSEUM_HOST="chartmuseum.${BASE_DOMAIN}"

export DOCKER_REGISTRY_INSTALLED="true"
export DOCKER_REGISTRY_IAM_ROLE="${CLUSTER_NAME}-docker-registry"
export DOCKER_REGISTRY_S3_REGION="${AWS_REGION}"
export DOCKER_REGISTRY_S3_ENDPOINT="s3.${AWS_REGION}.amazonaws.com"
export DOCKER_REGISTRY_S3_BUCKET="${CLUSTER_NAME}-docker-registry"
export DOCKER_REGISTRY_S3_ENCRYPT="false"
export DOCKER_REGISTRY_S3_SECURE="false"
export DOCKER_REGISTRY_HOST="docker-registry.${BASE_DOMAIN}"

export JENKINS_INSTALLED="true"
export JENKINS_USERNAME="admin"
export JENKINS_PASSWORD="password"
export JENKINS_HOST="jenkins.${BASE_DOMAIN}"
