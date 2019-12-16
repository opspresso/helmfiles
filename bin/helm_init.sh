#!/bin/bash

COUNT=$(kubectl get sa -n kube-system | grep 'tiller' | wc -l | xargs)
if [ "x${COUNT}" == "x0" ]; then
    kubectl create sa tiller -n kube-system
fi

COUNT=$(kubectl get clusterrolebinding | grep 'cluster-admin:kube-system:tiller' | wc -l | xargs)
if [ "x${COUNT}" == "x0" ]; then
    kubectl create clusterrolebinding cluster-admin:kube-system:tiller --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
fi

helm init --upgrade --service-account=tiller
