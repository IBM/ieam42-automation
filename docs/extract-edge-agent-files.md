# Extract the IEAM 4.2 agent files

1. Download the IBM Edge Application Manager 4.2 Agent package 
from [IBM Passport Advantage](https://www.ibm.com/support/knowledgecenter/SSFKVV_4.2/hub/part_numbers.html?view=kc) and save it in the directory 
`<your_home_dir/workspace`. Export the environment variable `IEAM_PACKAGE_FILE_NAME` with the downloaded file name 
and execute the shell script `install_hzn_cli.sh`. This will install the horizon CLI.
    
    > Note: Update `install_hzn_cli.sh` file as per your operating system. It supports Linux and macOS. By default, it is configured for macOS.

    ```markdown
    export IEAM_PACKAGE_FILE_NAME=<downloaded_file_name>
    export FIRST_ORG_ID=iac-example-ieam-cluster   # Feel free to choose any organization id.
    ./script/install_hzn_cli.sh
    ```

2. The environment variables in below will export the IEAM hub cluster URL, User Name and Password. You can log in to IEAM hub using these
credentials.

    ```markdown
    export CLUSTER_URL=https://$(oc get cm management-ingress-ibmcloud-cluster-info -o jsonpath='{.data.cluster_ca_domain}')
    export CLUSTER_USER=$(oc -n ibm-common-services get secret platform-auth-idp-credentials -o jsonpath='{.data.admin_username}' | base64 --decode)
    export CLUSTER_PW=$(oc -n ibm-common-services get secret platform-auth-idp-credentials -o jsonpath='{.data.admin_password}' | base64 --decode)
    ```

3. Extract the IEAM edge agent files to install it on each node.

    ```markdown
    ./script/extract_edge_node_files.sh
    ```

4. Log in to IEAM management hub via `cloudctl` and create an apikey. Note down the apikey for future use.

    ```markdown
    cloudctl login -a $CLUSTER_URL -u $CLUSTER_USER -p $CLUSTER_PW --skip-ssl-validation
    cloudctl iam api-key-create edge-app-apikey -d "API key to connect to IEAM hub" # You are free to choose any name for apikey
    ```

5. Locate the files **agent-install.sh** and **agent-uninstall.sh** as per your operating system. You will need these files to deploy IEAM agent on
the edge node.

    - Linux:
    
    ```markdown
    ls /usr/horizon/bin/agent-install.sh
    ls /usr/horizon/bin/agent-uninstall.sh
    ```
    
    - macOS:
    
    ```markdown
    ls /usr/local/bin/agent-install.sh
    ls /usr/local/bin/agent-uninstall.sh
    ```
    
## Next Step

- [Install the IEAM 4.2 agent](ieam42-agent-deploy.md)
