# Install the IEAM 4.2 Management hub

This page contains the bash commands to automate the installation of the IEAM 4.2 Management hub.

## Navigation

- [Prerequisites](#prerequisites)
- [Install IEAM 4.2](#install-ieam-42)

## Prerequisites

The requirements are documented in the 
[Environment Setup](https://ibm.github.io/cloud-enterprise-examples/iac/setup-environment). It includes:

- Have an IBM Cloud account with required privileges
- [Install IBM Cloud CLI](https://ibm.github.io/cloud-enterprise-examples/iac/setup-environment#install-ibm-cloud-cli)
- [Log in to IBM Cloud with the CLI](https://ibm.github.io/cloud-enterprise-examples/iac/setup-environment#login-to-ibm-cloud)
- Install the following tools:
  - [make](https://www.gnu.org/software/make/)
  - [IBM Cloud Pak CLI (cloudctl) and OpenShift client CLI (oc)](https://www.ibm.com/support/knowledgecenter/SSFKVV_4.2/cli/cloudctl_oc_cli.html)
  - [docker](https://www.ibm.com/links?url=https%3A%2F%2Fdocs.docker.com%2Fget-docker%2F)

## Install IEAM 4.2

1. Log in to your local linux/mac box with admin privileges. 
Retrieve and copy the [entitlement key](https://myibm.ibm.com/products-services/containerlibrary) and export the environment 
variable `IBM_CP_ENTITLEMENT_KEY`.

    ```markdown
    export IBM_CP_ENTITLEMENT_KEY=<Your_IBM_Cloud_Pak_Entitlement_Key>
    ```

2. (If not done in the previous step) Create `workspace` directory in your local linux/mac box. Download **ieam42-automation** project code.

    ```markdown
    mkdir <your_home_dir>/workspace
    cd <your_home_dir>/workspace
    git clone https://github.com/IBM/ieam42-automation.git
    cd ieam42-automation
    chmod +x script/*.sh
    ```

3. Log in to OpenShift cluster and execute the shell script `ieam-deploy.sh`. This will deploy the Common Services and IEAM and create IEAM hub.
   
    ```markdown
    oc login --token=<openshift_cluster_token> --server=<openshift_server_url>
    ./script/ieam-deploy.sh
    ```
   
4. After the above script is executed successfully, run below command and make sure that all the pods are either in **Running** 
or **Completed** status.

    ```markdown
    oc get pods -n ibm-common-services
    ```

## Next Step

- [Extract the IEAM 4.2 agent files](extract-edge-agent-files.md)
