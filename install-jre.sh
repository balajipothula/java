curl -JL https://download.oracle.com/otn/java/jdk/8u221-b11/230deb18db3e4014bb8e3e8324f81b43/server-jre-8u221-linux-x64.tar.gz?AuthParam=1567318300_74437d89e5554b3e2162c5b5dd9c8c2c -o $HOME/jre.tar.gz && \
tar -xzf jre.tar.gz -C $HOME                                && \
rm  -rf $HOME/jre.tar.gz                                    && \
mv      $HOME/jre* $HOME/jreroot                            && \
rm  -rf $HOME/jreroot/man                                   && \
find    $HOME/jreroot -maxdepth 2 -delete -type f ".txt"    && \
find    $HOME/jreroot -maxdepth 2 -delete -type f ".html"   && \
echo "export PATH=$PATH:$HOME/jreroot/bin" >> $HOME/.bashrc && \
echo "export JRE_HOME=$HOME/jreroot/jre"   >> $HOME/.bashrc && \
exec $BASH
