#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 04 September 2019,
# Description : Installing Java (JDK) from static binaries.

curl -JL https://github.com/frekele/oracle-java/releases/download/8u212-b10/jdk-8u212-linux-x64.tar.gz -o $HOME/jdk.tar.gz && \
tar  -xzf $HOME/jdk.tar.gz -C $HOME                                                                                        && \
rm   -rf  $HOME/jdk.tar.gz                                                                                                 && \
mv        $HOME/jdk* $HOME/java                                                                                            && \
find      $HOME/java -maxdepth 2 -name "*.txt"  -type f -delete                                                            && \
find      $HOME/java -maxdepth 2 -name "*.html" -type f -delete                                                            && \
find      $HOME/java -maxdepth 2 -name "*.zip"  -type f -delete                                                            && \
rm   -rf  $HOME/java/{COPYRIGHT,LICENSE,release}                                                                           && \
rm   -rf  $HOME/java/man                                                                                                   && \
rm   -rf  $HOME/java/jre/{COPYRIGHT,LICENSE,README}                                                                        && \
echo "export PATH=$PATH:$HOME/java/bin" >> $HOME/.bashrc                                                                   && \
echo "export JDK_HOME=$HOME/java" >> $HOME/.bashrc                                                                         && \
echo "export JRE_HOME=$HOME/java/jre" >> $HOME/.bashrc                                                                     && \
exec $BASH
