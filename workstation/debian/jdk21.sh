cd ~
wget https://download.oracle.com/java/21/latest/jdk-17_linux-x64_bin.tar.gz
sudo mkdir /usr/lib/jvm
sudo mv ./jdk-17_linux-x64_bin.tar.gz /usr/lib/jvm
cd /usr/lib/jvm
sudo tar -xvzf jdk-17_linux-x64_bin.tar.gz
sudo rm jdk-17_linux-x64_bin.tar.gz
sudo mv jdk-17.* jdk-17
cd ~
bash -c 'echo "PATH=/usr/lib/jvm/jdk-17/bin:$PATH" >> ~/.profile'
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-17/bin/java" 0
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk-17/bin/javac" 0
sudo update-alternatives --set java /usr/lib/jvm/jdk-17/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/jdk-17/bin/javac

 
