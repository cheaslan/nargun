# Vagrant for nargun
Vagrant.configure("2") do |config|
  # bareminimum archlinux build on daily basis
  config.vm.box = "archlinux/archlinux"
  config.vm.hostname = "nargun"
  config.ssh.forward_x11 = true
  # config.vm.network "public_network" # disabling due to unknown net errors
  config.vm.provider :virtualbox do |vb|
    # Enable USB 2.0
    # vb.customize ["modifyvm", :id, "--usb", "on", "--usbehci", "on"]
    # RAM 2GB
    vb.memory = 2048
     # CPU x2
    vb.cpus = 2
    vb.name = "nargun"
  end
  # VMWare Workstation (EXPERIMENTAL)
  config.vm.provider "vmware_workstation" do |vw, override|
    override.vm.box = 'hashicorp-vagrant/archlinux'
    #vw.gui = true
    vw.ssh_info_public = true
    vw.vmx['memsize'] = 2048
    vw.vmx['numvcpus'] = 2
    vw.vmx['displayname'] = 'nargun'
  end

  config.vm.provision "shell", inline: <<-SHELL
    echo "[i] Setting a network mirror"
    cp -v /vagrant/mirrorlist /etc/pacman.d/mirrorlist
    echo "[i] Applying latest updates"
    pacman -Syu --noconfirm
    echo "[i] Installing base tools"
    pacman -Sy --noconfirm coreutils wget git base-devel vim openvpn tmux gdb mitmproxy nmap john xorg-xauth xorg-xeyes chromium shared-mime-info
    cd /tmp \
    && sudo -u vagrant git clone https://aur.archlinux.org/package-query.git \
    && sudo -u vagrant git clone https://aur.archlinux.org/yaourt.git \
    && cd package-query \
    && sudo -u vagrant makepkg -si --noconfirm --nocheck \
    && cd ../yaourt \
    && sudo -u vagrant makepkg -si --noconfirm --nocheck \
    && cd /tmp \
    && rm -rf /tmp/package-query /tmp/yaourt
    sync
    echo "[i] Installing patator"
    sudo -u vagrant /usr/bin/yaourt -S --noconfirm patator python2-pycurl
    echo "[i] Installing GDB dashboard"
    wget -P /home/vagrant https://git.io/.gdbinit
    echo "[i] Adding message of the day"
    cp -v /vagrant/motd /etc/motd
    echo "[i] Enabling X11 forwarding"
    cp -v /vagrant/sshd_config /etc/ssh/
    systemctl restart sshd
    echo "[i] All done!"
  SHELL
end
