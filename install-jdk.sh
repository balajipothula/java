

curl -JL https://download.oracle.com/otn/java/jdk/8u221-b11/230deb18db3e4014bb8e3e8324f81b43/jdk-8u221-linux-x64.tar.gz?AuthParam=1567314397_adbc973545544b7b0de82cf304aa21ce -o $HOME/jdk.tar.gz && \
tar -xzf jdk.tar.gz -C $HOME                                 && \
rm -rf $HOME/jdk.tar.gz                                      && \
mv     $HOME/jdk* $HOME/javaroot                             && \
rm -rf $HOME/javaroot/{man,src.zip,javafx-src.zip}           && \
find   $HOME/javaroot -maxdepth 2 -delete -type f ".txt"     && \
find   $HOME/javaroot -maxdepth 2 -delete -type f ".html"    && \
echo "export PATH=$PATH:$HOME/javaroot/bin" >> $HOME/.bashrc && \
echo "export JAVA_HOME=$HOME/javaroot"      >> $HOME/.bashrc && \
exec $BASH
