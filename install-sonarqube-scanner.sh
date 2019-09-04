#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 16 August 2019,
# Description : Installing sonar scanner on rhel.

# https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.0.0.1744-linux.zip

# exits any line in the bash script fails.
set -e

# updating rhel packages.
sudo yum -y update

# installing openjdk8 unzip.
sudo yum -y install java-1.8.0-openjdk-devel.x86_64 unzip

# downloading and running sonarscanner.
curl -J -L https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.0.0.1744-linux.zip -o $HOME/sonar-scanner-cli.zip && \
unzip -q $HOME/sonar-scanner-cli.zip -d $HOME                                                                                                    && \
rm -rf   $HOME/sonar-scanner/jre/{legal,release}                                                                                                 && \
export PATH=$PATH:$HOME/sonar-scanner/bin
