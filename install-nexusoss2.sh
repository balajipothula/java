#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 16 August 2019,
# Description : Installing NexusOSS2 from static binaries.

curl -JL https://download.sonatype.com/nexus/oss/nexus-latest-bundle.tar.gz -o $HOME/nexus.tar.gz && \
tar  -xzf $HOME/nexus.tar.gz -C $HOME                                                             && \
rm   -rf  $HOME/nexus.tar.gz                                                                      && \
mv        $HOME/nexus-*       $HOME/nexusoss2                                                     && \
mv        $HOME/sonatype-work $HOME/artifactory                                                   && \
find      $HOME/nexusoss2     -maxdepth 1 -name "*.txt" -type f -delete                           && \
find      $HOME/nexusoss2/bin -maxdepth 1 -name "*.bat" -type f -delete                           && \
find      $HOME/artifactory   -maxdepth 1 -name "*.txt" -type f -delete                           && \
rm   -rf  $HOME/nexusoss2/bin/jsw/{license,linux-ppc*,linux-x86-32,macosx*,solaris*,windows*}     && \
sed -i 's/sonatype-work/artifactory/g' $HOME/nexusoss2/conf/nexus.properties                      && \
sh        $HOME/nexusoss2/bin/nexus start
