# Nargun
A minimal and immutable Linux distro for [Professional Hacker](https://elttam.com.au/training) training course.

# Spec
* OS: Archilinux 64bit
* RAM: 2GB
* CPU: 2 cores
* Hypervisor: VirtualBox (default) or VMWare Workstation/Fusion (Experimental)
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
4. Clone this repository and go to the cloned directory.
5. `vagrant up` and `vagrant ssh`
6. All done!

For applications with graphical user interface, Nargun supports both X11 forwarding and VNC.

## Linux
**Using VNC**

Install a VNC client on your host, e.g. [tigervnc](http://tigervnc.org/).
```
vagrant ssh
# ./vnc.sh APPLICATION
./vnc.sh chromium
```

Connect using VNC client on `localhost:5900`.

**Using X11**

```
export DISPLAY=localhost:0.0
vagrant ssh
chromium
```

## Windows
**Using VNC**

Install a VNC client on your host, e.g. [TightVNC](https://www.tightvnc.com/).
```
vagrant ssh
# ./vnc.sh APPLICATION
./vnc.sh chromium
```

Connect using VNC client on `localhost:5900`.

**Using X11**
Install [Xming](https://sourceforge.net/projects/xming/). Open and close terminal.

```
export DISPLAY=localhost:0.0
vagrant ssh
chromium
```

## OSX
**Using VNC**

```
vagrant ssh
# ./vnc.sh APPLICATION
./vnc.sh chromium
```

Connect using built-in VNC client `open vnc://localhost:5900`.

**Using X11**

Install [XQuartz](https://www.xquartz.org/), logout and login.
```
brew cask install xquartz virtualbox virtualbox-extension-pack vagrant
#logout/login
vagrant up
vagrant ssh
chromium --disable-gpu
```

# Usage

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

## cannot open display: localhost:10.0
Set DISPLAY environment variable. On Windows make sure Xming is running.

**Fedora**
```
sudo dnf install vagrant vagrant-libvirt
export DISPLAY:0.0
vagrant ssh
chromium
```

## libGL errors
Once you setup, XQuarts, login and logout.
```
vagrant ssh
chromium --disable-gpu
```

## Issues with Windows and Vagrant
Follow this [guide](https://www.swtestacademy.com/quick-start-vagrant-windows-10/).

## VNC client fails to connect
Check forwarded VNC port on the VM settings or during `vagrant up`
The VNC port may change in case it collides with a port already in use.
