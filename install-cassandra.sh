#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 04 September 2019,
# Description : Installing Cassandra from static binaries.

curl -JL https://www-us.apache.org/dist/cassandra/3.0.18/apache-cassandra-3.0.18-bin.tar.gz -o cassandra.tar.gz && \
tar  -xzf $HOME/cassandra.tar.gz -C $HOME                                                                       && \
rm   -rf  $HOME/cassandra.tar.gz                                                                                && \
mv        $HOME/apache-cassandra-* $HOME/cassandra                                                              && \
rm   -rf  $HOME/cassandra/{doc,javadoc}                                                                         && \
find      $HOME/cassandra -name "*.txt"  -type f -delete                                                        && \
find      $HOME/cassandra -name "*.bat"  -type f -delete                                                        && \
find      $HOME/cassandra -name "*.ps1"  -type f -delete                                                        && \
echo "export  PATH=$PATH:$HOME/cassandra/bin" >> $HOME/.bashrc                                                  && \
exec $BASH
