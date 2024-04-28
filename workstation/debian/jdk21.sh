cd ~
wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.tar.gz
sudo mkdir /usr/lib/jvm
sudo mv ./jdk-21_linux-x64_bin.tar.gz /usr/lib/jvm
cd /usr/lib/jvm
sudo tar -xvzf jdk-21_linux-x64_bin.tar.gz
sudo rm jdk-21_linux-x64_bin.tar.gz
sudo mv jdk-21.* jdk-21
cd ~
bash -c 'echo "PATH=/usr/lib/jvm/jdk-21/bin:$PATH" >> ~/.profile'
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-21/bin/java" 0
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk-21/bin/javac" 0
sudo update-alternatives --set java /usr/lib/jvm/jdk-21/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/jdk-21/bin/javac

 
