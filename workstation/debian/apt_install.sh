VERSION_CODENAME=bookworm

echo 'deb http://deb.debian.org/debian/ sid main contrib non-free non-free-firmware' >> /etc/apt/sources.list
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list
echo "deb [signed-by=/etc/apt/keyrings/lutris.gpg] https://download.opensuse.org/repositories/home:/strycore/Debian_12/ ./" |  tee /etc/apt/sources.list.d/lutris.list > /dev/null
apt update && apt upgrade -y
apt install apt-transport-https curl -y

#chrome
curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor | tee /usr/share/keyrings/google-chrome.gpg >> /dev/null
apt update
sudo apt install google-chrome-stable

#nvidia
apt install linux-headers-amd64 -y
apt install nvidia-legacy-390xx-driver firmware-misc-nonfree

#desktop
apt install gnome

#secure
sudo apt-get install gufw

wget -q -O- https://download.opensuse.org/repositories/home:/strycore/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/keyrings/lutris.gpg > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
  sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
  sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

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
sudo chmod 666 /var/run/docker.sock

sudo apt install nvidia-container-toolkit -y
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
sudo nvidia-ctk runtime configure --runtime=containerd
sudo systemctl restart containerd
sudo nvidia-ctk runtime configure --runtime=crio
sudo systemctl restart crio
