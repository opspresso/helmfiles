#!/bin/bash

# common
export AWS_REGION="ap-northeast-2"

export CLUSTER_NAME="dev-demo-eks"

export ROOT_DOMAIN="mzdev.be"
export BASE_DOMAIN="demo.${ROOT_DOMAIN}"

# kube-ingress
export CERT_MANAGER_ISSUER_EMAIL="me@nalbam.com"

export NGINX_INGRESS_CONTROLLER_KIND="DaemonSet"

# kube-system
export CLUSTER_AUTOSCALER_IAM_ROLE="${CLUSTER_NAME}-autoscaling"

export EFS_PROVISIONER_IAM_ROLE="${CLUSTER_NAME}-efs"
export EFS_FILE_SYSTEM_ID="$(aws efs describe-file-systems --creation-token ${CLUSTER_NAME} --region ${AWS_REGION} | jq -r '.FileSystems[].FileSystemId')"

# monitor
export PROMETHEUS_HOST="prometheus.${BASE_DOMAIN}"

export GRAFANA_HOST="grafana.${BASE_DOMAIN}"

# keycloak
export KEYCLOAK_USERNAME="admin"
export KEYCLOAK_PASSWORD="password"
export KEYCLOAK_HOST="keycloak.${BASE_DOMAIN}"

# argo
export ARGO_INGRESS_HOST="argo.${BASE_DOMAIN}"
export ARGO_IAM_ROLE="${CLUSTER_NAME}-argo"
export ARGO_BUCKET="${CLUSTER_NAME}-argo"

export ARGO_CD_INGRESS_HOST="argocd.${BASE_DOMAIN}"
export ARGO_CD_PASSWORD='$2a$10$RihNM/bmql87aKhSa/U0DOmTx5JDPl2byap07bLSNRtsEXFiq87E2'

# devops
export CHARTMUSEUM_IAM_ROLE="${CLUSTER_NAME}-chartmuseum"
export CHARTMUSEUM_STORAGE_AMAZON_BUCKET="${CLUSTER_NAME}-chartmuseum"
export CHARTMUSEUM_STORAGE_AMAZON_PREFIX="/"
export CHARTMUSEUM_STORAGE_AMAZON_REGION="${AWS_REGION}"
export CHARTMUSEUM_HOST="chartmuseum.${BASE_DOMAIN}"
# export CHARTMUSEUM_BASIC_AUTH_USER="server"
# export CHARTMUSEUM_BASIC_AUTH_PASS="924426A5-DA22-4A10-9FB1-418761684372"

export DOCKER_REGISTRY_IAM_ROLE="${CLUSTER_NAME}-docker-registry"
export DOCKER_REGISTRY_S3_REGION="${AWS_REGION}"
export DOCKER_REGISTRY_S3_ENDPOINT="s3.${AWS_REGION}.amazonaws.com"
export DOCKER_REGISTRY_S3_BUCKET="${CLUSTER_NAME}-docker-registry"
export DOCKER_REGISTRY_S3_ENCRYPT="false"
export DOCKER_REGISTRY_S3_SECURE="false"
export DOCKER_REGISTRY_HOST="docker-registry.${BASE_DOMAIN}"

export JENKINS_USERNAME="admin"
export JENKINS_PASSWORD="password"
export JENKINS_HOST="jenkins.${BASE_DOMAIN}"
