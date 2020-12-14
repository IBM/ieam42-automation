#! /bin/bash

# Export environment variables
export CLUSTER_URL=https://$(oc get cm management-ingress-ibmcloud-cluster-info -o jsonpath='{.data.cluster_ca_domain}')
export CLUSTER_USER=$(oc -n ibm-common-services get secret platform-auth-idp-credentials -o jsonpath='{.data.admin_username}' | base64 --decode)
export CLUSTER_PW=$(oc -n ibm-common-services get secret platform-auth-idp-credentials -o jsonpath='{.data.admin_password}' | base64 --decode)
oc --insecure-skip-tls-verify=true -n kube-public get secret ibmcloud-cluster-ca-cert -o jsonpath="{.data.ca\.crt}" | base64 --decode > ieam.crt
export HZN_MGMT_HUB_CERT_PATH="$PWD/ieam.crt"
export HZN_FSS_CSSURL=${CLUSTER_URL}/edge-css

cd ../*/agent || { echo "Directory agent does not exist."; exit; }

# Run the edgeNodeFiles.sh script to gather the necessary files and put them in the CSS (Cloud Sync Service) component of the Model Management System.
HZN_EXCHANGE_USER_AUTH='' edgeNodeFiles.sh ALL -c -p edge-packages-4.2.0