# Automating the installation of IBM Edge Application Manager (IEAM) 4.2.1

## Introduction

IEAM Installed on OpenShift cluster provides the edge computing features to manage and deploy workloads
from a management hub cluster to edge devices, cluster and remote instances of OpenShift Container Platform
or other Kubernetes-based clusters.

This project automates the installation of IEAM 4.2.1 on OpenShift cluster. It uses the virtual server or bare metal server to emulate the edge
device (edge node). It contains.

- The terraform and IBM schematics code to provision Red Hat OpenShift Classic cluster, Bare Metal Server, Virtual Server, IBM Cloudant database,
  and IBM Event Streams.
- This page contains the bash commands to automate the installation of the IEAM 4.2.1 Management hub on OpenShift cluster.
- The bash commands to automate the installation of the IEAM 4.2.1 agent on the edge node.

The following figure represents the typical network architecture of the IBM Edge components integrated with IBM Cloud services (such as IBM Event Streams, IBM Watson Studio Streams Flows, and IBM Cloudant) that can be implemented using this code.

![Network Architecture](docs/images/network-architecture.png)

> Note: You can skip Task 1 in below if you already have OpenShift cluster provisioned.

## Tasks

1. [Provision a Red Hat OpenShift Classic Cluster](docs/openshift-automation.md)
2. [Install the IEAM 4.2.1 Management hub](docs/ieam42-automation.md)
3. [Extract the IEAM 4.2.1 agent files](docs/extract-edge-agent-files.md)
4. [Install the IEAM 4.2.1 agent](docs/ieam42-agent-deploy.md)
