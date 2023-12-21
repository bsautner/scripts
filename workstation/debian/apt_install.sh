VERSION_CODENAME=bookworm

sudo echo 'deb http://deb.debian.org/debian/ sid main contrib non-free' >> /etc/apt/sources.list

echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | sudo tee /etc/apt/sources.list.d/google-chrome.list
echo "deb [signed-by=/etc/apt/keyrings/lutris.gpg] https://download.opensuse.org/repositories/home:/strycore/Debian_12/ ./" | sudo tee /etc/apt/sources.list.d/lutris.list > /dev/null
wget -q -O- https://download.opensuse.org/repositories/home:/strycore/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/keyrings/lutris.gpg > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update --fixe-missing && sudo apt upgrade -y && sudo apt dist-upgrade -y
sudo dpkg --add-architecture i386 && sudo apt-get update && sudo apt-get install wine32:i386
sudo apt install google-chrome-stable chrome-gnome-shell gnome-browser-connector apt-transport-https curl -y
sudo apt install nvidia-xconfig cpu-checker qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils -y
sudo apt install lutris
sudo apt install nvidia-driver-libs:i386
sudo apt install virtualbox virtualbox-ext-pack
sudo apt install remmina
sudo apt purge gnome-games

for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

