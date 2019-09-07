#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 04 September 2019,
# Description : Installing Tomcat from static binaries.

curl -JL http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.45/bin/apache-tomcat-8.5.45.tar.gz -o $HOME/tomcat.tar.gz && \
tar -xzf $HOME/tomcat.tar.gz -C $HOME                                                                                         && \
mv       $HOME/apache-tomcat-* $HOME/tomcat                                                                                   && \
rm  -rf  $HOME/tomcat.tar.gz                                                                                                  && \
find     $HOME/tomcat     -maxdepth 1 -name "*.md"  -type f -delete                                                           && \
find     $HOME/tomcat     -maxdepth 1 -name "*.txt" -type f -delete                                                           && \
find     $HOME/tomcat/bin -maxdepth 1 -name "*.bat" -type f -delete                                                           && \
rm  -rf  $HOME/tomcat/{LICENSE,NOTICE,RELEASE-NOTES}                                                                          && \
rm  -rf  $HOME/tomcat/webapps/{docs,examples,host-manager}                                                                    && \
sh       $HOME/tomcat/bin/startup.sh
