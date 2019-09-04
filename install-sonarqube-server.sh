#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 16 August 2019,
# Description : Installing sonar qube on rhel.

# https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-6.7.7.zip
# https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.2.1.zip

# updating rhel packages.
sudo yum -y update

# installing openjdk8 unzip.
sudo yum -y install java-1.8.0-openjdk-devel.x86_64 unzip

# downloading and running sonarqube.
curl -J -L https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.2.1.zip -o $HOME/sonarqube.zip    && \
unzip -q $HOME/sonarqube.zip -d $HOME                                                                            && \
rm -rf   $HOME/sonarqube.zip                                                                                     && \
mv       $HOME/sonarqube-* $HOME/sonarqube                                                                       && \
find     $HOME/sonarqube -name "COPYING" -type f -delete                                                         && \
find     $HOME/sonarqube -name "*.txt"   -type f -delete                                                         && \
rm -rf   $HOME/sonarqube/bin/{jsw-license,linux-x86-32,macosx*,windows*}                                         && \
sed -i 's/#sonar.jdbc.username=/sonar.jdbc.username=sonarqube/'            $HOME/sonarqube/conf/sonar.properties && \
sed -i 's/#sonar.jdbc.password=/sonar.jdbc.password=sonarqube123/'         $HOME/sonarqube/conf/sonar.properties && \
sed -i 's/#sonar.jdbc.url=jdbc:postgresql/sonar.jdbc.url=jdbc:postgresql/' $HOME/sonarqube/conf/sonar.properties && \
sh       $HOME/sonarqube/bin/linux-x86-64/sonar.sh start
