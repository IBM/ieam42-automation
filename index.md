# IBM Edge Application Manager (IEAM) 4.2 Automation

## Introduction

IEAM Installed on OpenShift cluster provides the edge computing features to manage and deploy workloads
from a management hub cluster to edge devices, cluster and remote instances of OpenShift Container Platform
or other Kubernetes-based clusters.

This project automates the installation of IEAM 4.2 on OpenShift cluster. It uses the virtual server or bare metal server to emulate the edge 
device (edge node). It contains.

- The terraform and IBM schematics code to provision Red Hat OpenShift Classic cluster, Bare Metal Server, Virtual Server, IBM Cloudant database,
  and IBM Event Streams.
- This page contains the bash commands to automate the deployment of the IEAM 4.2 hub on OpenShift cluster.
- The bash commands to automate the deployment of the IEAM 4.2 agent on the edge node.

## Content

- [OpenShift Classic Cluster - Automated Provisioning](docs/openshift-automation.md)
- [IBM Edge Application Manager (IEAM) 4.2 - Automated Installation](docs/ieam42-automation.md)
- [IBM Edge Application Manager (IEAM) 4.2 Agent - Installation](docs/ieam42-agent-deploy.md)