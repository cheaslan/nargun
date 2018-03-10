#!/bin/bash
echo "[i] VNC application runner - chromium"
echo "[i] Running x11vnc. Connect using your vnc client."

/usr/bin/x11vnc -create -env FD_PROG="/usr/bin/chromium --window-position=0,0 --window-size=1280,1024 --force-device-scale-factor=1" \
	-env X11VNC_FINDDISPLAY_ALWAYS_FAILS=1 \
        -env X11VNC_CREATE_GEOM=${1:-1280x1024x24} \
        -gone 'killall Xvfb' \
        -bg -nopw -o x11vnc.log
echo "[i] Done!"
