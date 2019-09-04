#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 16 August 2019,
# Description : Installing SonarQube from static binaries.

# installing unzip.
sudo yum -y install unzip

# https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-6.7.7.zip
# https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.2.1.zip

<<comment
sed -i 's/#sonar.embeddedDatabase.port=/sonar.embeddedDatabase.port=/'     $HOME/sonarqube/conf/sonar.properties && \
comment

# sonarqube downloading, extracting and running.
curl -J -L https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.2.1.zip -o $HOME/sonarqube.zip    && \
unzip -q $HOME/sonarqube.zip -d $HOME                                                                            && \
rm -rf   $HOME/sonarqube.zip                                                                                     && \
mv       $HOME/sonarqube-* $HOME/sonarqube                                                                       && \
rm -rf $HOME/sonarqube/COPYING                                                                                   && \
find     $HOME/sonarqube -name "*.txt"   -type f -delete                                                         && \
rm -rf   $HOME/sonarqube/bin/{jsw-license,linux-x86-32,macosx*,windows*}                                         && \
sed -i 's/#sonar.jdbc.username=/sonar.jdbc.username=sonarqube/'            $HOME/sonarqube/conf/sonar.properties && \
sed -i 's/#sonar.jdbc.password=/sonar.jdbc.password=sonarqube123/'         $HOME/sonarqube/conf/sonar.properties && \
sed -i 's/#sonar.jdbc.url=jdbc:postgresql/sonar.jdbc.url=jdbc:postgresql/' $HOME/sonarqube/conf/sonar.properties && \
sh       $HOME/sonarqube/bin/linux-x86-64/sonar.sh start
