#! /bin/bash

# Extract the IEAM agent package
tar -zxvf ../$IEAM_PACKAGE_FILE_NAME -C ../ \
&& { cd ../*/tools || { echo "Directory tools does not exist."; exit; } }

# Validate the installation stats
./service_healthcheck.sh

# Extract the Edge package
cd ../agent && tar -zxvf edge-packages*.tar.gz

# Install hzn CLI in Debian Linux
# Uncomment out this to install in Debian Linux
#sudo apt-get install ./edge-packages-4.2.0/linux/deb/amd64/horizon-cli*.deb

# Install hzn CLI in Red Hat Linux
# Uncomment out this to install in Red Hat Linux
#sudo dnf install -yq ./edge-packages-4.2.0/linux/rpm/x86_64/horizon-cli-*.x86_64.rpm

#Install hzn CLI in MacOS
sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain edge-packages-4.2.0/macos/pkg/x86_64/horizon-cli.crt && \
sudo installer -pkg edge-packages-4.2.0/macos/pkg/x86_64/horizon-cli-*.pkg -target /

# Create first organization and publish the sample patterns and services in IEAM hub
cd ../tools && ./post_install.sh $FIRST_ORG_ID