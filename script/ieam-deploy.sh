#! /bin/bash

# Deploy IBM operator catalog
oc apply -f ieam-deploy/ibm-operator-catalog.yaml

# Deploy IBM operator common services catalog
oc apply -f ieam-deploy/ibm-operator-common-services-catalog.yaml

# Wait for the catalog to get created
sleep 30

# Create new namespace ibm-edge
oc new-project ibm-edge || oc project ibm-edge

# Create registry secret
oc create secret docker-registry ibm-entitlement-key --docker-server=cp.icr.io --docker-username=cp --docker-password=$IBM_CP_ENTITLEMENT_KEY

# Deploy IBM operator IEAM group
oc apply -f ieam-deploy/ibm-operator-ieam-group.yaml

# Deploy IEAM
oc apply -f ieam-deploy/ibm-operator-ieam-subscribe.yaml

# Wait for the IEAM services to be up and running
sleep 300

# Configure common services to add mongodb and prometheus operators configuration
oc apply -f ieam-deploy/ibm-common-services.yaml

# Create IEAM hub
oc apply -f ieam-deploy/ibm-ieam-hub.yaml