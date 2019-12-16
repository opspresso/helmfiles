#!/bin/bash

COUNT=$(kubectl get ns | grep 'kube-ingress' | wc -l | xargs)
if [ "x${COUNT}" == "x0" ]; then
    kubectl create ns kube-ingress
fi

ELB_DNS_NAME=$(kubectl get svc -n kube-ingress | grep nginx-ingress-controller | grep LoadBalancer | awk '{print $4}')
echo "ELB_DNS_NAME: ${ELB_DNS_NAME}"

if [ -z ${ELB_DNS_NAME} ]; then
    echo "ELB_DNS_NAME is null."
    exit 1
fi

ELB_NAME=$(echo ${ELB_DNS_NAME} | cut -d'-' -f1)
echo "ELB_NAME: ${ELB_NAME}"

if [ -z ${ELB_NAME} ]; then
    echo "ELB_NAME is null."
    exit 1
fi

# ELB 에서 Hosted Zone ID 를 획득
ELB_ZONE_ID=$(aws elb describe-load-balancers --load-balancer-name ${ELB_NAME} | jq -r '.LoadBalancerDescriptions[] | .CanonicalHostedZoneNameID')
echo "ELB_ZONE_ID: ${ELB_ZONE_ID}"

if [ -z ${ELB_ZONE_ID} ]; then
    echo "ELB_ZONE_ID is null."
    exit 1
fi

if [ -z ${ROOT_DOMAIN} ]; then
    echo "ROOT_DOMAIN is null."
    exit 1
fi

if [ -z ${BASE_DOMAIN} ]; then
    echo "BASE_DOMAIN is null."
    exit 1
fi

# Route53 에서 해당 도메인의 Hosted Zone ID 를 획득
ZONE_ID=$(aws route53 list-hosted-zones | ROOT_DOMAIN="${ROOT_DOMAIN}." jq -r '.HostedZones[] | select(.Name==env.ROOT_DOMAIN) | .Id' | cut -d'/' -f3)
echo "ZONE_ID: ${ZONE_ID}"

if [ -z ${ZONE_ID} ]; then
    echo "ZONE_ID is null."
    exit 1
fi

RECORD=/tmp/sets.json
cat <<EOF > ${RECORD}
{
  "Changes": [
    {
      "Action": "UPSERT",
      "ResourceRecordSet": {
        "Name": "*.${BASE_DOMAIN}",
        "Type": "A",
        "AliasTarget": {
          "HostedZoneId": "${ELB_ZONE_ID}",
          "DNSName": "${ELB_DNS_NAME}",
          "EvaluateTargetHealth": false
        }
      }
    }
  ]
}
EOF

cat ${RECORD}

aws route53 change-resource-record-sets --hosted-zone-id ${ZONE_ID} --change-batch file://${RECORD}
