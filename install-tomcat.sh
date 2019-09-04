#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 04 September 2019,
# Description : Installing Tomcat from static binaries.

curl -JL http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.45/bin/apache-tomcat-8.5.45.tar.gz -o $HOME/tomcat.tar.gz && \
tar  -xzf $HOME/tomcat.tar.gz -C $HOME                                                                                        && \
rm   -rf  $HOME/tomcat.tar.gz                                                                                                 && \
mv        $HOME/apache-tomcat-* $HOME/tomcat                                                                                  && \
find      $HOME/tomcat -name "*.txt" -type f -delete                                                                          && \
find      $HOME/tomcat -name "*.md"  -type f -delete                                                                          && \
rm   -rf  $HOME/tomcat/{LICENSE,NOTICE,RELEASE-NOTES}                                                                         && \
rm   -rf  $HOME/tomcat/webapps/{docs,examples,host-manager}
