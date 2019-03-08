#!/bin/bash

set -e
export AZURE_HTTP_USER_AGENT="GITHUBACTIONS_${GITHUB_ACTION_NAME}_${GITHUB_REPOSITORY}"

if [ -z "$RESOURCE_GROUP" ]; then
	echo "no resouce group provided"
fi

if [ -z "$AKS_APPID" ]; then
	echo "no AKS account information available"
fi

if [ -z "$AKS_PW" ]; then
	echo "no password secret"
fi

if [ -z "$AKS_APPID" ]; then
	echo "no appID available"
fi

if [ -z "$SUBSCRIPTION_ID" ]; then
	echo "no Azure subscription ID provided"
fi

# check cluster config existence
# TODO

# Give it a try
aks-engine deploy --subscription-id $SUBSCRIPTION_ID \
	  --client-id $AKS_APPID --client-secret $AKS_PW \
	    --location westus2 --dns-prefix kata-deploy-testing \
	      --api-model  $CLUSTER_CONFIG  --force-overwrite



if [ -z "$KUBECONFIG" ]; then
  export KUBECONFIG=_output/kubeconfig/kubeconfig.westus2.json
fi

kubectl all the things
