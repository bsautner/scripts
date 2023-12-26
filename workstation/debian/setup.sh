sudo sed -i 's/#IdleTimeout=30/IdleTimeout=0/' /etc/bluetooth/input.conf

sudo cp 99-tartarus_v2.hwdb /etc/udev/hwdb.d
sudo systemd-hwdb update
sudo udevadm trigger
