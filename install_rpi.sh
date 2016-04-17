# fix usb bugs for rpi
CMD_LINE_FIX=" dwc_otg.fiq_fsm_mask=0xF"
if ! grep -q "$CMD_LINE_FIX" /boot/cmdline.txt; then
  sudo su -c "echo \"$CMD_LINE_FIX\" >> /boot/cmdline.txt"
fi

# add rotonde to /etc/hosts so modules just have to connect to rotonde:4224
ETC_HOST="127.0.0.1 rotonde"
if ! grep -q "$ETC_HOST"; then
  sudo su -c "echo \"$ETC_HOST\" >> /etc/hosts"
fi

MOD_ENABLE="overlay"
if ! grep -q "$MOD_ENABLE"; then
  sudo su -c "echo \"$MOD_ENABLE\" >> /etc/modules"
  echo "!!!! rebooting ... please re-run this script on reboot ... reboot in 5 seconds"
  sleep 5
  sudo reboot
fi

if ! which -s docker; then
  # TODO check version
  # download and install docker
  curl -O https://downloads.hypriot.com/docker-hypriot_1.10.3-1_armhf.deb && sudo dpkg -i docker-hypriot_1.10.3-1_armhf.deb
fi

# start docker on boot
sudo systemctl enable docker
sudo systemctl start docker

sudo curl -o /usr/loca/bin/rotonde 

# start rotonde modules, automatically restarts modules on failure (and on boot)
sudo docker run --privileged --restart=always -d --name rotonde --net=host hackerloop/rotonde-rpi
