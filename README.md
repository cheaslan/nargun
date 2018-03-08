# Nargun
A minimal and immutable Linux distro for [Professional Hacker](https://elttam.com.au/training) training course.

# Spec
* OS: Archilinux 64bit
* RAM: 2GB
* CPU: 2 cores
* Hypervisor: VirtualBox (default)
* Default user: vagrant (with sudo)
* Build: Vagrant (to build and destroy the VM)

# Tools
* vim
* openvpn
* gdb
* gdb dashboard
* mitmproxy
* nmap
* john
* patator (multi-purpose brute-forcer)
* yaourt (for easy package management)
* chromium

# Install
1. Download and setup [Vagrant](https://www.vagrantup.com/)
2. Download and setup [VirtualBox](https://www.virtualbox.org/) and Extension Pack.
3. Clone this repository
4. `vagrant up` and `vagrant ssh`
5. All done!

Note: For Vagrant on Windows, you may need to setup a SSH client.
Follow this [guide](https://www.swtestacademy.com/quick-start-vagrant-windows-10/)

# Usage
X11 forwarding is enabled by default. `vagrant ssh` and run any X11 program

## Shared directory with the host
By default the current host directory is mapped to `/vagrant` on the VM.

## Add mitmproxy cert to Chromium
Start chromium. start mitmproxy to generate certificate. close both.
run `certutil -d sql:$HOME/.pki/nssdb -A -t C -n mitmproxy -i ~/.mitmproxy/mitmproxy-ca-cert.pem`

## Use Chromium with mitmproxy
Make sure X11 forwarding is enabled on your SSH client.
```
tmux
mitmproxy
# CTRL + b
chromium --proxy-server=localhost:8080`
```

## Install a new package
`yaourt [PACKAGE NAME]`

## Uninstall
To follow immutable principle, destroy the VM after every usage:
`vagrant destroy`

# Troubleshooting
## Tab completion doesn't work
`TERM=xterm; vagrant ssh`

## .Xauthority does not exit
When you SSH for the first time, ignore the following error message.
.Xauthority will be created.
`/usr/bin/xauth:  file /home/vagrant/.Xauthority does not exist`
