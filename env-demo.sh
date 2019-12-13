#!/bin/bash

# common
export AWS_REGION="ap-northeast-2"

export CLUSTER_NAME="seoul-dev-demo-eks"

export BASE_DOMAIN="demo.mzdev.be"

# kube-ingress
export CERT_MANAGER_INSTALLED="true"
export CERT_MANAGER_RBAC_ENABLED="true"
export CERT_MANAGER_ISSUER_EMAIL="me@nalbam.com"

export NGINX_INGRESS_INSTALLED="true"
export NGINX_INGRESS_CONTROLLER_KIND="DaemonSet"

# kube-system
export CLUSTER_AUTOSCALER_INSTALLED="true"
export CLUSTER_AUTOSCALER_IAM_ROLE="${CLUSTER_NAME}-autoscaling"

export CLUSTER_OVERPROVISIONER_INSTALLED="true"

export KUBE_STATE_METRICS_INSTALLED="true"

export KUBE2IAM_INSTALLED="true"

export METRICS_SERVER_INSTALLED="true"

# monitor
export PROMETHEUS_INSTALLED="true"

export GRAFANA_INSTALLED="true"
export GRAFANA_HOST="grafana-monitor.${BASE_DOMAIN}"

# devops
export ARGO_INSTALLED="true"
export ARGO_INGRESS_HOST="argo-devops.${BASE_DOMAIN}"
export ARGO_IAM_ROLE="${CLUSTER_NAME}-argo"
export ARGO_BUCKET="${CLUSTER_NAME}-argo"

export ARGO_CD_INSTALLED="true"
export ARGO_CD_INGRESS_HOST="argocd-devops.${BASE_DOMAIN}"
export ARGO_CD_PASSWORD='$2a$10$RihNM/bmql87aKhSa/U0DOmTx5JDPl2byap07bLSNRtsEXFiq87E2'

export ARGO_EVENTS_INSTALLED="true"

export CHARTMUSEUM_INSTALLED="true"
export CHARTMUSEUM_IAM_ROLE="${CLUSTER_NAME}-chartmuseum"
export CHARTMUSEUM_DEBUG="true"
export CHARTMUSEUM_DISABLE_API="false"
export CHARTMUSEUM_ALLOW_OVERWRITE="true"
export CHARTMUSEUM_STORAGE_AMAZON_BUCKET="${CLUSTER_NAME}-chartmuseum"
export CHARTMUSEUM_STORAGE_AMAZON_PREFIX="/"
export CHARTMUSEUM_STORAGE_AMAZON_REGION="${AWS_REGION}"
export CHARTMUSEUM_BASIC_AUTH_USER="server"
export CHARTMUSEUM_BASIC_AUTH_PASS="924426A5-DA22-4A10-9FB1-418761684372"
export CHARTMUSEUM_HOST="chartmuseum-devops.${BASE_DOMAIN}"

export DOCKER_REGISTRY_INSTALLED="true"
export DOCKER_REGISTRY_IAM_ROLE="${CLUSTER_NAME}-docker-registry"
export DOCKER_REGISTRY_S3_REGION="${AWS_REGION}"
export DOCKER_REGISTRY_S3_ENDPOINT="s3.${AWS_REGION}.amazonaws.com"
export DOCKER_REGISTRY_S3_BUCKET="${CLUSTER_NAME}-docker-registry"
export DOCKER_REGISTRY_S3_ENCRYPT="false"
export DOCKER_REGISTRY_S3_SECURE="false"
export DOCKER_REGISTRY_HOST="docker-registry-devops.${BASE_DOMAIN}"

export JENKINS_INSTALLED="true"
export JENKINS_USERNAME="admin"
export JENKINS_PASSWORD="password"
export JENKINS_HOST="jenkins-devops.${BASE_DOMAIN}"
