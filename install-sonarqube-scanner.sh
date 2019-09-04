#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 16 August 2019,
# Description : Installing SonarQube Scanner from static binaries.

# https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.0.0.1744-linux.zip

# installing unzip.
sudo yum -y unzip

# downloading and running sonarscanner.
curl  -JL https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.0.0.1744-linux.zip -o $HOME/sonar-scanner-cli.zip && \
unzip -q  $HOME/sonar-scanner-cli.zip -d $HOME                                                                                                  && \
rm    -rf $HOME/sonar-scanner/jre/{legal,release}                                                                                               && \
echo "export PATH=$PATH:$HOME/sonar-scanner/bin" >> $HOME/.bashrc                                                                               && \
exec $BASH
