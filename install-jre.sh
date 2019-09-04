#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 04 September 2019,
# Description : Installing Java (JRE) from static binaries.

curl -JL https://github.com/frekele/oracle-java/releases/download/8u212-b10/jre-8u212-linux-x64.tar.gz -o $HOME/jre.tar.gz && \
tar  -xzf $HOME/jre.tar.gz -C $HOME                                                                                        && \
rm   -rf  $HOME/jre.tar.gz                                                                                                 && \
mv        $HOME/jre* $HOME/java                                                                                            && \
find      $HOME/java -maxdepth 2 -name "*.txt"  -type f -delete                                                            && \
find      $HOME/java -maxdepth 2 -name "*.html" -type f -delete                                                            && \
rm   -rf  $HOME/java/{COPYRIGHT,LICENSE,README,release}                                                                    && \
rm   -rf  $HOME/java/man                                                                                                   && \
echo "export PATH=$PATH:$HOME/java/bin" >> $HOME/.bashrc                                                                   && \
echo "export JRE_HOME=$HOME/java" >> $HOME/.bashrc                                                                         && \
exec $BASH
