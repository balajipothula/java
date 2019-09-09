#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 04 September 2019,
# Description : Installing jenkins.war on Tomcat from static binaries.

<<comment
http://apachemirror.wuchna.com/tomcat/tomcat-7/v7.0.96/bin/embed/apache-tomcat-7.0.96-embed.tar.gz
http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.45/bin/apache-tomcat-8.5.45-deployer.tar.gz
http://apachemirror.wuchna.com/tomcat/tomcat-9/v9.0.24/bin/apache-tomcat-9.0.24-deployer.tar.gz
comment

curl -JL http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.45/bin/apache-tomcat-8.5.45.tar.gz -o $HOME/tomcat.tar.gz && \
tar -xzf $HOME/tomcat.tar.gz -C $HOME                                                                                         && \
mv       $HOME/apache-tomcat-*  $HOME/tomcat                                                                                  && \
rm  -rf  $HOME/tomcat.tar.gz                                                                                                  && \
find     $HOME/tomcat     -maxdepth 1 -name "*.md"  -type f -delete                                                           && \
find     $HOME/tomcat     -maxdepth 1 -name "*.txt" -type f -delete                                                           && \
find     $HOME/tomcat/bin -maxdepth 1 -name "*.bat" -type f -delete                                                           && \
rm  -rf  $HOME/tomcat/{LICENSE,NOTICE,RELEASE-NOTES}                                                                          && \
rm  -rf  $HOME/tomcat/webapps/{docs,examples,host-manager,manager,ROOT}                                                       && \
curl -JL https://updates.jenkins-ci.org/latest/jenkins.war -o $HOME/tomcat/webapps/ROOT.war                                   && \
sh       $HOME/tomcat/bin/startup.sh
